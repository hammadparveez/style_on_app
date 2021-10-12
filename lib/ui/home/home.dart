import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ameno_ipsum/flutter_ameno_ipsum.dart';
import 'package:style_on_app/exports.dart';
import 'package:style_on_app/exports/ui_exports.dart';
import 'package:style_on_app/exports/utils_export.dart';
import 'package:style_on_app/utils/constants/images_paths.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final salomonBottomBarItems = [
    SalomonBottomBarItem(
        icon: const Icon(CupertinoIcons.home),
        title: const Text(AppStrings.home)),
    SalomonBottomBarItem(
        icon: const Icon(CupertinoIcons.bell),
        title: const Text(AppStrings.notifications)),
    SalomonBottomBarItem(
        icon: const Icon(CupertinoIcons.heart),
        title: const Text(AppStrings.favorite)),
    SalomonBottomBarItem(
        icon: const Icon(CupertinoIcons.person),
        title: const Text(AppStrings.profile)),
  ];

  final products = [
    ProductContainer(imgPath: ImagePaths.color),
    ProductContainer(imgPath: ImagePaths.d2),
    ProductContainer(imgPath: ImagePaths.d3),
    ProductContainer(imgPath: ImagePaths.d1),
    ProductContainer(imgPath: ImagePaths.d4),
    ProductContainer(imgPath: ImagePaths.d5),
    ProductContainer(imgPath: ImagePaths.d6),
    ProductContainer(imgPath: ImagePaths.p5),
    ProductContainer(imgPath: ImagePaths.p6),
    ProductContainer(imgPath: ImagePaths.authMainImg),
    ProductContainer(imgPath: ImagePaths.onBoardImg),
  ];

  @override
  Widget build(BuildContext context) {
    final heightExcludeAppbar = context.h() - kToolbarHeight;
    return Scaffold(
      backgroundColor: Color(0xFFE6E6E6),
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
          )),
      body: SingleChildScrollView(
        child: SizedBox(
          height: heightExcludeAppbar,
          child: Column(
            children: [
              SizedBox(
                height: heightExcludeAppbar * .2,
                child: Image.asset(ImagePaths.bg,
                    width: context.w(), fit: BoxFit.cover),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            _buildCategoryButton(context, "Women"),
                            _buildCategoryButton(context, "Men"),
                            _buildCategoryButton(context, "Kids"),
                            _buildCategoryButton(context, "Babies"),
                            _buildCategoryButton(context, "Boys"),
                            _buildCategoryButton(context, "Women Small"),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: StaggeredGridView.countBuilder(
                            itemCount: products.length,
                            crossAxisCount: 2,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: context.dp(10),
                            shrinkWrap: true,
                            staggeredTileBuilder: (i) => StaggeredTile.fit(1),
                            itemBuilder: (_, index) {
                              return products[index];
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: 1,
        items: salomonBottomBarItems,
      ),
    );
  }

  TextButton _buildCategoryButton(BuildContext context, String title) {
    return TextButton(
        style: Theme.of(context).textButtonTheme.style?.copyWith(
            foregroundColor: MaterialStateProperty.all(Colors.black54)),
        onPressed: () {},
        child: Text(title, style: TextStyle(fontWeight: FontWeight.w700)));
  }
}

class ProductContainer extends StatelessWidget {
  const ProductContainer({
    Key? key,
    required this.imgPath,
  }) : super(key: key);
  final String imgPath;
  @override
  Widget build(BuildContext context) {
    const _defaultRadius = Radius.circular(8);
    const imageRadius =
        BorderRadius.only(topLeft: _defaultRadius, topRight: _defaultRadius);
    const containerRadius = BorderRadius.only(
        bottomLeft: _defaultRadius, bottomRight: _defaultRadius);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        LayoutBuilder(builder: (context, c) {
          debugPrint("Cons $c");
          return SizedBox(
            height: c.maxWidth,
            width: c.maxWidth,
            child: ClipRRect(
              borderRadius: imageRadius,
              child: Image.asset(
                imgPath,
                fit: BoxFit.cover,
              ),
            ),
          );
        }),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: containerRadius,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              !(imgPath == ImagePaths.d4)
                  ? const SizedBox()
                  : SvgPicture.asset(
                      ImagePaths.googleIcon,
                      height: 20,
                    ),
              Text(
                "3 Pack 360 Spin Magic Mop Replacement Heat Shower Mop",
                maxLines: 2,
                style: Theme.of(context).textTheme.subtitle2,
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Text("Rs: 499"),
                  const SizedBox(width: 5),
                  Text(
                    "Rs: 699",
                    style: TextStyle(
                        fontSize: 11, decoration: TextDecoration.lineThrough),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              //  imgPath == ImagePaths.d4
              //    ? const SizedBox()
              Row(
                children: [
                  ...List.generate(
                      5,
                      (i) => Icon(CupertinoIcons.star_fill,
                          size: 14, color: Color(0xFFF7EA3B))),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                "Pakistan",
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    ?.copyWith(fontSize: 11, color: Color(0xFF919191)),
              )
            ],
          ),
        ),
      ],
    );
  }
}
