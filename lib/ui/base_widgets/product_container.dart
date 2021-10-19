import 'package:flutter/cupertino.dart';
import 'package:style_on_app/exports.dart';

class ProductContainer extends StatelessWidget {
  final String imgPath, price;
  //final double _bottomPaddingValue = 15;
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
      margin: const EdgeInsets.symmetric(horizontal: kPaddingSmall),
      decoration: BoxDecoration(
        borderRadius:
            imageRadius, // to give radius from bottom as well otherise ClipRRect works fine
        color: kWhiteColor,
        boxShadow: const [
          BoxShadow(
            color: kLightGrey,
            blurRadius: 2,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: imageRadius,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(child: _buildProductImageStackedIcons()),
            _buildProductBrief(context),
          ],
        ),
      ),
    );
  }

  Padding _buildProductBrief(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kPaddingDefault),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            maxLines: 2,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                fontWeight: FontWeight.normal, fontSize: kfontSmallest13),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kPaddingSmall),
            child: _buildPrices(),
          ),
          _buildRatingBar(),
          smallestVrtSpacer,
          _buildCountry()
        ],
      ),
    );
  }

  LayoutBuilder _buildProductImageStackedIcons() {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        height: constraints.maxWidth + kPadding15,
        width: constraints.maxWidth,
        child: Stack(
          children: [
            _buildPositionedImage(),
            _buildHeartIconButton(context),
          ],
        ),
      );
    });
  }

  Positioned _buildPositionedImage() {
    return Positioned.fill(
      child: Padding(
        padding: const EdgeInsets.only(bottom: kPadding15),
        child: ExtendedImage.network(imgPath),
      ),
    );
  }

  Text _buildCountry() {
    return Text(
      "Pakistan",
      style: Theme.of(navigatorKey.currentContext!)
          .textTheme
          .subtitle2
          ?.copyWith(fontWeight: FontWeight.normal),
    );
  }

  Widget _buildPrices() {
    return FittedBox(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(text: "Rs: " + price),
            const WidgetSpan(child: smallestHztSpacer),
            if (discountPrice != null && discountPrice!.isNotEmpty)
              TextSpan(
                text: "Rs: ${discountPrice ?? '0'} ",
                style: Theme.of(navigatorKey.currentContext!)
                    .textTheme
                    .subtitle2
                    ?.copyWith(
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.lineThrough,
                    ),
              ),
            TextSpan(
              text: " ${calcDiscount(price, discountPrice ?? '0').toInt()}%",
              style: Theme.of(navigatorKey.currentContext!).textTheme.subtitle2,
            ),
          ],
        ),
        style: Theme.of(navigatorKey.currentContext!)
            .textTheme
            .bodyText2
            ?.copyWith(color: kLightYellow),
      ),
    );
  }

  Row _buildRatingBar() {
    return Row(
      children: [
        ...List.generate(
            rating,
            (i) => const Icon(CupertinoIcons.star_fill,
                size: 14, color: kLightestYellow)),
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
                size: context.dp(18), color: kWhiteColor),
          ),
        ));
  }
}
