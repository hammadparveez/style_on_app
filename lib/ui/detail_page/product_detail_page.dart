import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:style_on_app/exports.dart';

class ProductDetailPage extends StatefulWidget {
  ProductDetailPage({Key? key, required this.model}) : super(key: key);
  ProductModel model;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  late ExpandableController _expandableController;
  @override
  void initState() {
    super.initState();
    _expandableController = ExpandableController()..expanded = true;
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
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        actions: [
          IconButton(icon: const Icon(CupertinoIcons.search), onPressed: () {}),
          IconButton(icon: const Icon(CupertinoIcons.bell), onPressed: () {}),
          PopupMenuButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            itemBuilder: (ctx) {
              return const [
                PopupMenuItem(child: Text("Flutter")),
                PopupMenuItem(child: Text("Dart")),
                PopupMenuItem(child: Text("Javascript")),
                PopupMenuItem(child: Text("React JS")),
              ];
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          //height: context.h() - kToolbarHeight,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 25),
                CarouselSlider.builder(
                    itemCount: widget.model.imagesLinks!.length,
                    itemBuilder: (ctx, index, pageIndex) {
                      return ClipRRect(
                          child: ExtendedImage.network(
                              widget.model.imagesLinks![index]));
                    },
                    options: CarouselOptions(
                      height: context.h() * .4,
                      viewportFraction: .7,
                      enlargeCenterPage: false,
                      disableCenter: true,
                      enableInfiniteScroll: false,
                    )),
                Text(
                  "Rs: " + widget.model.price,
                  style: TextStyle(
                      fontSize: 17,
                      color: Color(0xFFFDB85C),
                      fontWeight: FontWeight.w700),
                ),
                if (widget.model.discountPrice != null &&
                    widget.model.discountPrice!.isNotEmpty)
                  Row(
                    children: [
                      Text(
                        "Rs: " + widget.model.discountPrice!,
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFFD4D4D4),
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "-${calcDiscount(widget.model.price, widget.model.discountPrice!).toInt()} %",
                        style: TextStyle(
                          color: Color(0xFFB6B6B6),
                        ),
                      ),
                    ],
                  ),
                Divider(),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      widget.model.title,
                      style: TextStyle(fontSize: 16, color: Color(0xFF555555)),
                    )),
                Row(
                  children: List.generate(
                      widget.model.rating,
                      (index) => const Icon(Icons.star_outlined,
                          color: Colors.yellow, size: 20)),
                ),
                const SizedBox(height: 5),
                Divider(),
                ExpandablePanel(
                    controller: _expandableController,
                    header: const Text(
                      AppStrings.desc,
                      style: TextStyle(
                          color: Color(0xFF888888),
                          fontWeight: FontWeight.w600),
                    ),
                    collapsed: const SizedBox(),
                    expanded: Text(
                      "${widget.model.desc}",
                      style: TextStyle(fontSize: 15, height: 1.5),
                    )),
                Divider(),
                FractionallySizedBox(
                  widthFactor: 1,
                  child: ColoredBox(
                    color: Color(0xFFF0F0F0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 5),
                      child: Text("Related Products",
                          style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF858585),
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                ),
                SizedBox(
                  height: context.h(.35),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    shrinkWrap: true,
                    itemBuilder: (ctx, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: SizedBox(
                          width: context.w(.45),
                          child: ProductContainer(
                              imgPath: widget.model.imagesLinks![0],
                              price: "2040",
                              title: widget.model.title,
                              hasAddedWishList: true,
                              rating: 3),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.cart), label: "Buy Now"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.heart), label: "Add to Wishlist"),
        ],
      ),
    );
  }
}
