import 'dart:convert';
import 'dart:developer';

import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:style_on_app/domain/model/bag_model.dart';
import 'package:style_on_app/domain/services/riverpod/pods.dart';
import 'package:style_on_app/exports.dart';
import 'package:style_on_app/ui/base_widgets/default_appbar.dart';

class ProductDetailPage extends StatefulWidget {
  ProductDetailPage({Key? key, required this.model}) : super(key: key);
  final ProductModel model;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage>
    with AnimationMixin {
  late ExpandableController _expandableController;
  late CustomAnimationControl _optionAnimController;
  late Widget swtichedWidget;
  int colorSelectedIndex = 0, sizeSelectedIndex = 0;
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read(bagService).fetchAllCart();
    });
    _optionAnimController = CustomAnimationControl.stop;
    _expandableController = ExpandableController()..expanded = true;
    swtichedWidget = _buildBottomNavigation();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    for (var image in widget.model.imagesLinks!) {
      precacheImage(NetworkImage(image), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        firstIcon: CupertinoIcons.search,
        secondIcon: CupertinoIcons.bell,
        onFirstTap: () {},
        onSecondTap: () {},
        onThirdTap: () {
          Navigator.pushNamed(context, Routes.cart);
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kPaddingDefault),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              largestVrtSpacer,
              _imageSlider(context),
              _buildPrices(),
              const Divider(),
              _productTitle(),
              Row(
                children: List.generate(
                    widget.model.rating,
                    (index) => const Icon(Icons.star_outlined,
                        color: Colors.yellow, size: 20)),
              ),
              smallestVrtSpacer,
              _optionsSelector(),
              const Divider(),
              _buildDescriptionBox(),
              const Divider(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kPaddingDefault),
        child: _buildAnimatedSwitcher(),
      ),
    );
  }

  ExpandablePanel _buildDescriptionBox() {
    return ExpandablePanel(
        controller: _expandableController,
        header: Text(
          AppStrings.desc,
          style: Theme.of(context)
              .textTheme
              .subtitle2
              ?.copyWith(color: kMedGrey, fontSize: kfontSmallest13),
        ),
        collapsed: const SizedBox(),
        expanded: Text(
          "${widget.model.desc}",
          style: Theme.of(context)
              .textTheme
              .bodyText2
              ?.copyWith(fontSize: kfontSmallest13, height: 1.5),
        ));
  }

  Row _optionsSelector() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.model.options?.color == null
            ? const SizedBox()
            : Expanded(child: _buildColorChooser()),
        widget.model.options?.size == null
            ? const SizedBox()
            : _buildSizeChooser(),
      ],
    );
  }

  Padding _productTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kPaddingSmall),
      child: Text(widget.model.title,
          style: Theme.of(context)
              .textTheme
              .bodyText2
              ?.copyWith(fontSize: kfont14)),
    );
  }

  Widget _buildPrices() {
    return Padding(
      padding: const EdgeInsets.only(top: kPaddingDefault),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Rs: " + widget.model.price,
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(color: kLightYellow, fontSize: kfont16),
          ),
          if (widget.model.discountPrice != null &&
              widget.model.discountPrice!.isNotEmpty)
            Row(
              children: [
                Text(
                  "Rs: " + widget.model.discountPrice!,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: kMedGrey,
                        decoration: TextDecoration.lineThrough,
                        fontWeight: FontWeight.normal,
                      ),
                ),
                mediumHztSpacer,
                Text(
                    "-${calcDiscount(widget.model.price, widget.model.discountPrice!).toInt()} %",
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          color: kMedGrey,
                        )),
              ],
            ),
        ],
      ),
    );
  }

  Expanded _buildSizeChooser() {
    return Expanded(
      flex: 2,
      child: Wrap(
        alignment: WrapAlignment.end,
        runSpacing: 5,
        children: [
          for (int i = 0; i < widget.model.options!.size!.length; i++)
            GestureDetector(
              onTap: () {
                setState(() {
                  sizeSelectedIndex = i;
                });
              },
              child: Container(
                height: 30 * MediaQuery.textScaleFactorOf(context),
                width: 40 * MediaQuery.textScaleFactorOf(context),
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: kPaddingSmall),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kValue8),
                  color: kThemeColor,
                  border: sizeSelectedIndex == i
                      ? Border.all(width: 2, color: kLightRed)
                      : null,
                ),
                child: FittedBox(
                  child: Text(
                    (widget.model.options!.size![i] as String).toUpperCase(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle2?.copyWith(
                          //fontSize: kfontSmallest,
                          fontWeight: FontWeight.bold,
                          color: kWhiteColor,
                        ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  AnimatedSwitcher _buildAnimatedSwitcher() {
    return AnimatedSwitcher(
      transitionBuilder: (Widget child, Animation<double> animation) {
        debugPrint("Animation ${animation.value}");
        final offsetAnimation =
            Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(0, 0))
                .animate(animation);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
      switchInCurve: Curves.decelerate,
      switchOutCurve: Curves.decelerate,
      duration: const Duration(milliseconds: 500),
      child: swtichedWidget,
    );
  }

  Widget _buildColorChooser() {
    return Wrap(
        //mainAxisSize: MainAxisSize.min,
        children: [
          for (int index = 0;
              index < widget.model.options!.color!.length;
              index++)
            GestureDetector(
              onTap: () {
                setState(() {
                  colorSelectedIndex = index;
                  _optionAnimController = CustomAnimationControl.playFromStart;
                });
              },
              child: CustomAnimation<double>(
                  control: _optionAnimController,
                  tween: Tween(begin: 0, end: 2.5),
                  duration: const Duration(milliseconds: 250),
                  builder: (context, child, value) {
                    return Container(
                      height: 25 * MediaQuery.textScaleFactorOf(context),
                      width: 25 * MediaQuery.textScaleFactorOf(context),
                      margin: EdgeInsets.symmetric(horizontal: kPaddingSmall),
                      decoration: BoxDecoration(
                        border: colorSelectedIndex == index
                            ? Border.all(color: kThemeColor, width: value)
                            : null,
                        color: HexColor(widget.model.options!.color![index]),
                        shape: BoxShape.circle,
                      ),
                    );
                  }),
            ),
        ]);
  }

  Widget _addToCartButton() {
    return FullWidthIconButton(
      onTap: () {
        setState(() {
          swtichedWidget = _buildBottomNavigation();
        });
        Navigator.of(context).pushNamed(Routes.cart);
      },
      text: const Text(AppStrings.buyNow),
    );
  }

  Widget _buildBottomNavigation() {
    return FullWidthIconButton(
        key: const ValueKey('cart-button'),
        buttonColor: kThemeColor,
        text: const Text(AppStrings.addToCart),
        onTap: () async {
          var model = widget.model;
          var color = model.options?.color?[colorSelectedIndex];
          var size = model.options?.size?[sizeSelectedIndex];

          await context.read(bagService).addToCart(
                BagModel(
                  productThumbnail: model.imagesLinks![0],
                  productTitle: model.title,
                  option: [color, size],
                  productPrice: double.tryParse(model.price) ?? 0,
                ),
              );

          swtichedWidget = _addToCartButton();
          setState(() {});
        });
    return BottomNavigationBar(
      onTap: (index) async {},
      items: const [
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.shopping_cart),
            label: AppStrings.addToCart),
        BottomNavigationBarItem(
            icon: Icon(Icons.local_shipping_outlined),
            label: AppStrings.addToWishlist),
      ],
    );
  }

  CarouselSlider _imageSlider(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: widget.model.imagesLinks!.length,
        itemBuilder: (ctx, index, pageIndex) {
          return Container(
              decoration: const BoxDecoration(
                color: kWhiteColor,
                boxShadow: [
                  BoxShadow(color: kLightGrey, blurRadius: 10),
                ],
              ),
              child: ExtendedImage.network(widget.model.imagesLinks![index]));
        },
        options: CarouselOptions(
          height: context.h() * .4,
          viewportFraction: .7,
          enlargeCenterPage: true,
          disableCenter: true,
          enableInfiniteScroll: false,
        ));
  }
}








     //Related Products Commented
              // const FractionallySizedBox(
              //   widthFactor: 1,
              //   child: ColoredBox(
              //     color: kWhiteColor,
              //     child: Padding(
              //       padding:  EdgeInsets.symmetric(
              //           vertical: kPaddingDefault, horizontal: kPaddingSmall),
              //       child: Text("Related Products",
              //           style: TextStyle(
              //               fontSize: 16,
              //               color: Color(0xFF858585),
              //               fontWeight: FontWeight.w600)),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: context.h(.35),
              //   child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: 6,
              //     shrinkWrap: true,
              //     itemBuilder: (ctx, index) {
              //       return Padding(
              //         padding: const EdgeInsets.symmetric(horizontal: 5),
              //         child: SizedBox(
              //           width: context.w(.45),
              //           child: ProductContainer(
              //               imgPath: widget.model.imagesLinks![0],
              //               price: "2040",
              //               title: widget.model.title,
              //               hasAddedWishList: true,
              //               rating: 3),
              //         ),
              //       );
              //     },
              //   ),
              // )