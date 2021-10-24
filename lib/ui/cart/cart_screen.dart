import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:style_on_app/domain/model/bag_model.dart';
import 'package:style_on_app/domain/services/cart_service.dart';
import 'package:style_on_app/domain/services/riverpod/pods.dart';
import 'package:style_on_app/exports/pkgs_exports.dart';
import 'package:style_on_app/exports/ui_exports.dart';
import 'package:style_on_app/exports/utils_export.dart';
import 'package:style_on_app/ui/base_widgets/default_appbar.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final animatedKey = GlobalKey<SliverAnimatedListState>();
  double totalAmount = 0;
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read(cartService).fetchAllCart();
    });
  }

  _deleteItem(BagModel model, int index) async {
    context.read(cartService).deleteCart(index);
    animatedKey.currentState?.removeItem(index, (context, animation) {
      return _buildCartItem(model, index, animation);
    }, duration: const Duration(milliseconds: 300));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        onThirdTap: () {
          //show WishList Icon and Replace Rout with WishList
          //Navigator.pop(context)
        },
        replaceCartWidget: IconButton(
            icon: Icon(CupertinoIcons.heart),
            onPressed: () {
              context.read(cartService).deleteAllCarts();
            }),
        firstIcon: CupertinoIcons.bell,
        onFirstTap: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.all(kPadding10),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(),
            Consumer(builder: (context, watch, value) {
              var _list = watch(cartService).items;
              if (watch(cartService).status == LoadingStatus.loading) {
                return _buildLoaderIndicator();
              } else if (watch(cartService).items.isEmpty) {
                return SliverFillRemaining(
                    child: Center(
                  child: Text("Oops! Nothing found in cart",
                      textScaleFactor: 1.5,
                      style: Theme.of(context).textTheme.bodyText1),
                ));
              }

              return SliverAnimatedList(
                key: animatedKey,
                initialItemCount: _list.length,
                itemBuilder: (_, index, animation) {
                  totalAmount += _list[index].productPrice;
                  return _buildCartItem(_list[index], index, animation);
                },
              );
            }),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Total: ", style: Theme.of(context).textTheme.subtitle2),
                Consumer(builder: (context, watch, child) {
                  return Text("Rs: ${watch(cartService).totalAmount}");
                }),
              ],
            ),
            LayoutBuilder(builder: (context, constriants) {
              // log("Constriants $constriants");
              return SizedBox(
                width: constriants.maxWidth,
                child: CustomElevatedButton(
                    buttonColor: kThemeColor,
                    text: Consumer(
                      builder: (context, watch, child) {
                        final addToCartWidth =
                            _textSize("Add something to cart").width;
                        final checkOutWidth =
                            _textSize("Checkout Immediately").width;
                        final halfWidth =
                            (constriants.maxWidth - addToCartWidth) / 2.5;
                        final checkOutHalfWidth =
                            (constriants.maxWidth - checkOutWidth) / 2.5;
                        if (watch(cartService).items.isEmpty) {
                          return Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              MirrorAnimation<Offset>(
                                  builder: (_, child, value) {
                                    return Transform.translate(
                                      offset: value,
                                      child: Icon(Icons.arrow_back_ios,
                                          color: kMedRed),
                                    );
                                  },
                                  curve: Curves.decelerate,
                                  tween: Tween(
                                      begin: Offset(0, 0),
                                      end: Offset(-halfWidth, 0))),
                              Text("Add something to cart"),
                            ],
                          );
                        } else {
                          return Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              child!,
                              MirrorAnimation<Offset>(
                                  builder: (_, child, value) {
                                    return Transform.translate(
                                      offset: value,
                                      child: Icon(Icons.arrow_forward_ios,
                                          color: kMedRed),
                                    );
                                  },
                                  curve: Curves.decelerate,
                                  tween: Tween(
                                      begin: Offset(checkOutHalfWidth, 0),
                                      end: Offset(0, 0))),
                            ],
                          );
                        }
                      },
                      child: Text("Checkout Immediately"),
                    ),
                    onTap: () {
                      if (context.read(cartService).items.isEmpty) {
                        Navigator.pushNamedAndRemoveUntil(context, Routes.home,
                            (route) {
                          log("Routes :${route.settings.name}");
                          return route.settings.name == Routes.detailProduct
                              ? true
                              : false;
                        });
                      }
                    }),
              );
            }),
          ],
        ),
      ),
    );
  }

  Size _textSize(String text, [TextStyle? style]) {
    final textPaint = TextPainter(
        text: TextSpan(text: text, style: style),
        textDirection: TextDirection.ltr)
      ..layout();
    return textPaint.size;
  }

  Widget _buildLoaderIndicator() {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
          child: MirrorAnimation<double>(
              tween: Tween(begin: 0, end: 50),
              builder: (context, child, value) {
                return Container(
                  margin: EdgeInsets.only(top: value),
                  child: const CircularProgressIndicator(
                    backgroundColor: kThemeColor,
                    valueColor: AlwaysStoppedAnimation<Color>(kMedRed),
                  ),
                );
              })),
    );
  }

  Widget _buildCartItem(
      BagModel model, int index, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: Stack(
        children: [
          Container(
            height: context.h(.15),
            padding: const EdgeInsets.all(kPadding10),
            margin: const EdgeInsets.only(bottom: kPadding15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kValue10),
              color: kWhiteColor,
              boxShadow: const [
                BoxShadow(color: kLightGrey, blurRadius: 5),
              ],
            ),
            child: LayoutBuilder(builder: (context, constraints) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Image
                  _buildCartImage(constraints, model.productThumbnail),
                  //Title
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildText(
                          model.productTitle,
                        ),
                        //Price
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: kPaddingSmall),
                          child: Row(
                            children: [
                              _buildText("Rs: ${model.productPrice}"),
                              smallestHztSpacer,
                              Text("x ${model.qty}",
                                  style: Theme.of(context).textTheme.subtitle2),
                            ],
                          ),
                        ),
                        //Options
                        model.option.isEmpty
                            ? const SizedBox()
                            : Row(
                                children: [
                                  model.option[0] == null
                                      ? const SizedBox()
                                      : Container(
                                          width: constraints.maxHeight * .2,
                                          height: constraints.maxHeight * .2,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: HexColor(model.option[0]),
                                          ),
                                        ),
                                  model.option[0] == null &&
                                          model.option[1] == null
                                      ? const SizedBox()
                                      : const Text(" / "),
                                  //const SizedBox(width: 5),
                                  model.option[1] == null
                                      ? const SizedBox()
                                      : _buildText(
                                          "${sizeStringify(model.option[1])}",
                                          Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              ?.copyWith(color: kDarkGrey),
                                        ),
                                ],
                              ),
                      ],
                    ),
                  ),
                  const SizedBox(width: kValue10),
                  Center(
                    child: Row(
                      children: [
                        InkWell(
                            child: const Icon(Icons.add_circle),
                            onTap: () {
                              log("Tapped");
                              context
                                  .read(cartService)
                                  .updateCart(index, UpdateBagType.increment);
                            }),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kPaddingSmall),
                          child: Consumer(builder: (context, watch, child) {
                            return _buildText("${model.qty}");
                          }),
                        ),
                        InkWell(
                          child: const Icon(Icons.remove_circle),
                          onTap: () {
                            if (model.qty > 1) {
                              context
                                  .read(cartService)
                                  .updateCart(index, UpdateBagType.decrement);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
          ),
          Positioned(
              top: -kPadding10,
              right: -kPadding10,
              child: IconButton(
                  splashRadius: 1,
                  color: kDarkGrey,
                  iconSize: kValue20,
                  icon: Icon(Icons.close),
                  onPressed: () => _deleteItem(model, index))),
        ],
      ),
    );
  }

  Text _buildText(String title, [TextStyle? style]) {
    return Text(
      title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: style ?? Theme.of(context).textTheme.bodyText1,
    );
  }

  Widget _buildCartImage(BoxConstraints constraints, String thumbnail) {
    return Padding(
      padding: const EdgeInsets.only(right: kPaddingDefault),
      child: Image.network(
        thumbnail,
        fit: BoxFit.cover,
        width: constraints.maxHeight,
        height: constraints.maxHeight,
      ),
    );
  }
}
