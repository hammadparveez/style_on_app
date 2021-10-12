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
    ProductContainer(imgPath: ImagePaths.authMainImg),
    ProductContainer(imgPath: ImagePaths.bg),
    ProductContainer(imgPath: ImagePaths.onBoardImg),
    ProductContainer(imgPath: ImagePaths.p1),
    ProductContainer(imgPath: ImagePaths.p2),
    ProductContainer(imgPath: ImagePaths.p3),
    ProductContainer(imgPath: ImagePaths.p4),
    ProductContainer(imgPath: ImagePaths.p5),
    ProductContainer(imgPath: ImagePaths.p6),
  ];

  @override
  Widget build(BuildContext context) {
    final heightExcludeAppbar = context.h() - kToolbarHeight;
    return Scaffold(
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
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Color(0xFFC0C0C0), blurRadius: 5, offset: Offset(0, 0)),
        ],
      ),
      margin: EdgeInsets.only(right: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: FractionallySizedBox(
              widthFactor: 1,
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: 200,
                  minHeight: 100,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  image: DecorationImage(
                      image: AssetImage(ImagePaths.earphone),
                      fit: BoxFit.fitWidth),
                ),
                child: Column(
                  children: [
                    Align(alignment: Alignment.topRight, child: Text("-20%")),
                  ],
                ),
              ),
            ),
            //  Stack(
            //   children: [
            //     FractionallySizedBox(
            //       widthFactor: 1,
            //       child: ConstrainedBox(
            //         constraints: const BoxConstraints(minHeight: 100),
            //         child: Image.asset(imgPath, fit: BoxFit.cover),
            //       ),
            //     ),
            //     Positioned(
            //       right: 0,
            //       child: IconButton(
            //           constraints: BoxConstraints(),
            //           onPressed: () {},
            //           color: Color(0xFFFFFFFF),
            //           icon: Icon(CupertinoIcons.heart_circle_fill)),
            //     ),
            //     Positioned(
            //       bottom: 0,
            //       left: 0,
            //       right: 0,
            //       child: Padding(
            //         padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
            //         child: Row(
            //           mainAxisSize: MainAxisSize.min,
            //           crossAxisAlignment: CrossAxisAlignment.end,
            //           children: [
            //             Flexible(
            //               child: Text(
            //                   "Flutter is awesome to learn. Flutter is fun as well",
            //                   maxLines: 2,
            //                   style: Theme.of(context).textTheme.subtitle2),
            //             ),
            //             Text("\$20.25",
            //                 style: Theme.of(context).textTheme.subtitle2),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
      ),
    );
  }
}
