import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:style_on_app/domain/model/bag_model.dart';
import 'package:style_on_app/domain/services/cart_service.dart';
import 'package:style_on_app/domain/services/riverpod/pods.dart';
import 'package:style_on_app/exports/pkgs_exports.dart';
import 'package:style_on_app/exports/ui_exports.dart';
import 'package:style_on_app/exports/utils_export.dart';
import 'package:style_on_app/ui/bag/components/bag_item_image.dart';
import 'package:style_on_app/ui/bag/components/card_circular_color.dart';
import 'package:style_on_app/ui/bag/components/card_item_component.dart';
import 'package:style_on_app/ui/bag/components/card_title.dart';
import 'package:style_on_app/ui/bag/components/custom_item_card.dart';
import 'package:style_on_app/ui/bag/components/empty_list_msg.dart';
import 'package:style_on_app/ui/base_widgets/centered_animated_loader.dart';
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
      context.read(bagService).fetchAllCart();
    });
  }

  _deleteItem(BagModel model, int index) async {
    context.read(bagService).deleteCart(index);
    animatedKey.currentState?.removeItem(index, (context, animation) {
      return _buildCartItem(model, index, animation);
    }, duration: const Duration(milliseconds: 300));
  }

  _updateCart(int index, UpdateBagType type) {
    context.read(bagService).updateCart(index, type);
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
            icon: const Icon(CupertinoIcons.heart),
            onPressed: () {
              context.read(bagService).deleteAllCarts();
            }),
        firstIcon: CupertinoIcons.bell,
        onFirstTap: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.all(kPadding10),
        child: CustomScrollView(
          slivers: [
            //Empty [SliverToBoxAdapter] because On Consumer Status Update
            // Creating SliverAnimatedList  throws Error
            const SliverToBoxAdapter(),
            Consumer(builder: (context, watch, value) {
              var _list = watch(bagService).items;
              if (watch(bagService).status == LoadingStatus.loading) {
                return const SliverFillRemaining(
                  child: CenteredAnimatedLoader(),
                );
              } else if (watch(bagService).items.isEmpty) {
                return const SliverEmptyListMsg(
                    msg: 'Oops! Nothing found in cart');
              }

              return SliverAnimatedList(
                key: animatedKey,
                initialItemCount: _list.length,
                itemBuilder: (_, index, animation) {
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
                  return Text("Rs: ${watch(bagService).totalAmount}");
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
                        if (watch(bagService).items.isEmpty) {
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
                      if (context.read(bagService).items.isEmpty) {
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
  //TextPainter which returns Text Width using Canvas
  Size _textSize(String text, [TextStyle? style]) {
    final textPaint = TextPainter(
        text: TextSpan(text: text, style: style),
        textDirection: TextDirection.ltr)
      ..layout();
    return textPaint.size;
  }

  Widget _buildCartItem(
      BagModel model, int index, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: Stack(
        children: [
          CustomItemCard(
            child: LayoutBuilder(builder: (context, constraints) {
              return CardItemsComponents(
                constraints: constraints,
                child: _cardItems(index, model),
              );
            }),
          ),
          _removeCartButton(model, index),
        ],
      ),
    );
  }

  Positioned _removeCartButton(BagModel model, int index) {
    return Positioned(
        top: -kPadding10,
        right: -kPadding10,
        child: IconButton(
            splashRadius: 1,
            color: kDarkGrey,
            iconSize: kValue20,
            icon: Icon(Icons.close),
            onPressed: () => _deleteItem(model, index)));
  }

  _cardItems(int index, BagModel model) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //Image
        BagItemImage(imageUri: model.productThumbnail),
        //Title
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CardTitle(model.productTitle),
              _buildCardPriceWithQty(index, model),
              _buildOptions(index, model),
            ],
          ),
        ),
        mediumHztSpacer,
        _buildUpdateCartBtns(index, model),
      ],
    );
  }

  Center _buildUpdateCartBtns(int index, BagModel model) {
    return Center(
      child: Row(
        children: [
          InkWell(
            child: const Icon(Icons.add_circle),
            onTap: () {
              _updateCart(index, UpdateBagType.increment);
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPaddingSmall),
            child: CardTitle("${model.qty}"),
          ),
          InkWell(
            child: const Icon(Icons.remove_circle),
            onTap: () => _updateCart(index, UpdateBagType.decrement),
          ),
        ],
      ),
    );
  }

  Padding _buildCardPriceWithQty(int index, BagModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kPaddingSmall),
      child: Row(
        children: [
          CardTitle("Rs: ${model.productPrice}"),
          smallestHztSpacer,
          Text("x ${model.qty}", style: Theme.of(context).textTheme.subtitle2),
        ],
      ),
    );
  }

  Widget _buildOptions(int index, model) {
    const emptyspacer = SizedBox();
    if (model.option.isEmpty) {
      return emptyspacer;
    } else {
      var hasColor = model.option[0] != null;
      var hasSize = model.option[1] != null;
      var showSlash = hasColor && hasSize;
      return Row(
        children: [
          hasColor ? CardCircularColor(hexColor: model.option[0]) : emptyspacer,
          showSlash ? const Text(" / ") : emptyspacer,
          
          hasSize
              ? CardTitle(
                  sizeStringify(model.option[1]),
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: kDarkGrey),
                )
              : emptyspacer,
        ],
      );
    }
  }
}
