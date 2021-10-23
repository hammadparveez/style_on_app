import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:style_on_app/domain/model/bag_model.dart';
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

  @override
  void initState() {
    super.initState();
    context.read(cartService).fetchAllCart();
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
        firstIcon: CupertinoIcons.bell,
        onFirstTap: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.all(kPadding10),
        child: CustomScrollView(
          slivers: [
            Consumer(builder: (context, watch, value) {
              var _list = watch(cartService).items;

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
                          index.toString(),
                        ),
                        //Price
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: kPaddingSmall),
                          child: _buildText("Rs: ${model.productPrice}"),
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
                            child: const Icon(Icons.add_circle), onTap: () {}),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kPaddingSmall),
                          child: _buildText("35"),
                        ),
                        InkWell(
                            child: const Icon(Icons.remove_circle),
                            onTap: () {}),
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
