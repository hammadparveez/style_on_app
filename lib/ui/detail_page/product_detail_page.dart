import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:style_on_app/exports.dart';

class ProductDetailPage extends StatefulWidget {
  ProductDetailPage({Key? key, required this.model}) : super(key: key);
  ProductModel model;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage>
    with AnimationMixin {
  late ExpandableController _expandableController;
  late Widget swtichedWidget;
  late Animation<Offset> _offsetAnimation;
  @override
  void initState() {
    super.initState();
    _expandableController = ExpandableController()..expanded = true;
    _offsetAnimation = Tween<Offset>(begin: Offset(0, 0), end: Offset(50, 0))
        .animate(createController());
    swtichedWidget = _buildBottomNavigation();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    for (var image in widget.model.imagesLinks!) {
      precacheImage(NetworkImage(image), context);
    }
  }

  Widget _cartIconWithBadge(IconData icon, int value, [VoidCallback? onTap]) {
    assert(value >= 0);
    return Padding(
      padding: const EdgeInsets.only(right: kPaddingSmall),
      child: Stack(
        children: [
          IconButton(
            icon: Icon(icon),
            onPressed: onTap,
          ),
          Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: kThemeColor),
                child: Text(value > 99 ? "99+" : "$value",
                    style: TextStyle(
                      color: kWhiteColor,
                      fontSize: kfontSmallest11,
                      fontWeight: FontWeight.w600,
                    )),
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        actions: [
          IconButton(icon: const Icon(CupertinoIcons.search), onPressed: () {}),
          IconButton(icon: const Icon(CupertinoIcons.bell), onPressed: () {}),
          _cartIconWithBadge(CupertinoIcons.bag, 5, () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kPaddingDefault),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              largestVrtSpacer,
              _imageSlider(context),
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
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: kPaddingSmall),
                child: Text(widget.model.title,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        ?.copyWith(fontSize: kfont14)),
              ),
              Row(
                children: List.generate(
                    widget.model.rating,
                    (index) => const Icon(Icons.star_outlined,
                        color: Colors.yellow, size: 20)),
              ),
              smallestVrtSpacer,
              const Divider(),
              ExpandablePanel(
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
                  )),
              const Divider(),
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: AnimatedSwitcher(
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
      ),
    );
  }

  Widget _addToCartButton() {
    return FullWidthIconButton(
      onTap: () {
        setState(() {
          swtichedWidget = _buildBottomNavigation();
        });
      },
      text: const Text(AppStrings.buyNow),
    );
  }

  BottomNavigationBar _buildBottomNavigation() {
    return BottomNavigationBar(
      onTap: (index) {
        debugPrint("Index $index");
        swtichedWidget = _addToCartButton();
        setState(() {});
      },
      items: const [
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.shopping_cart), label: "Add to Cart"),
        BottomNavigationBarItem(
            icon: Icon(Icons.local_shipping_outlined), label: "Buy Now"),
      ],
    );
  }

  CarouselSlider _imageSlider(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: widget.model.imagesLinks!.length,
        itemBuilder: (ctx, index, pageIndex) {
          return ClipRRect(
              child: ExtendedImage.network(widget.model.imagesLinks![index]));
        },
        options: CarouselOptions(
          height: context.h() * .4,
          viewportFraction: .7,
          enlargeCenterPage: false,
          disableCenter: true,
          enableInfiniteScroll: false,
        ));
  }
}
