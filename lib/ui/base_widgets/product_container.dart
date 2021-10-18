import 'package:flutter/cupertino.dart';
import 'package:style_on_app/exports.dart';

class ProductContainer extends StatelessWidget {
  final String imgPath, price;
  final double _bottomPaddingValue = 15;
  final imageRadius = BorderRadius.circular(8);
  final String title;
  final String? discountPrice;
  final bool hasAddedWishList;
  final int rating;

  ProductContainer(
      {Key? key,
      required this.imgPath,
      required this.price,
      this.discountPrice,
      required this.title,
      required this.hasAddedWishList,
      required this.rating})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: imageRadius,
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
              color: Color(0xFFD4D4D4), blurRadius: 2, offset: Offset(0, 1)),
        ],
      ),
      child: ClipRRect(
        borderRadius: imageRadius,
        child: Column(
          children: [
            _buildProductImageStackedIcons(),
            _buildProductBrief(context),
          ],
        ),
      ),
    );
  }

  Padding _buildProductBrief(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            maxLines: 2,
            style: Theme.of(context).textTheme.subtitle2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: _buildPrices(),
          ),
          _buildRatingBar(),
          const SizedBox(height: 5),
          _buildCountry(context)
        ],
      ),
    );
  }

  LayoutBuilder _buildProductImageStackedIcons() {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        height: constraints.maxWidth + _bottomPaddingValue,
        width: constraints.maxWidth,
        child: Stack(
          children: [
            _buildPositionedImage(),
            //PositionedDirectional(top: 5, end: 8, child: Text("20%")),
            _buildHeartIconButton(context),
          ],
        ),
      );
    });
  }

  Positioned _buildPositionedImage() {
    return Positioned.fill(
      child: Padding(
        padding: EdgeInsets.only(bottom: _bottomPaddingValue),
        child: ExtendedImage.network(
          imgPath,
        ),
        // Image.asset(
        //   imgPath,
        //   fit: BoxFit.cover,
        // ),
      ),
    );
  }

  Text _buildCountry(BuildContext context) {
    return Text(
      "Pakistan",
      style: Theme.of(context)
          .textTheme
          .subtitle2
          ?.copyWith(fontSize: 11, color: Color(0xFF919191)),
    );
  }

  Text _buildPrices() {
    const discountStyle = TextStyle(color: Color(0xFFBBBBBB), fontSize: 11);
    return Text.rich(
        TextSpan(
          children: [
            TextSpan(text: "Rs: " + price),
            const WidgetSpan(child: SizedBox(width: 5)),
            if (discountPrice != null && discountPrice!.isNotEmpty)
              TextSpan(
                text: "Rs: ${discountPrice!} ",
                style: discountStyle.copyWith(
                    decoration: TextDecoration.lineThrough,
                    decorationThickness: 3),
              ),
            TextSpan(
              text: " ${calcDiscount(price, discountPrice!).toInt()}%",
              style: discountStyle,
            ),
          ],
        ),
        style: const TextStyle(color: Color(0xFFD4A347)));
  }

  Row _buildRatingBar() {
    return Row(
      children: [
        ...List.generate(
            rating,
            (i) => Icon(CupertinoIcons.star_fill,
                size: 14, color: Color(0xFFF7EA3B))),
      ],
    );
  }

  Positioned _buildHeartIconButton(BuildContext context) {
    return Positioned(
        bottom: 0,
        right: 8,
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  color: Color(0xA4BBBBBB), spreadRadius: -2, blurRadius: 3),
            ],
          ),
          child: InkWell(
            onTap: () {},
            child: Icon(CupertinoIcons.heart_circle_fill,
                size: context.dp(18), color: Colors.white),
          ),
        ));
  }
}
