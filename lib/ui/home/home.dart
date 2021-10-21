import 'package:flutter/cupertino.dart';
import 'package:style_on_app/domain/freezed_collection.dart';
import 'package:style_on_app/domain/services/riverpod/pods.dart';

import 'package:style_on_app/exports.dart';
import 'package:style_on_app/exports/utils_export.dart';
import 'package:style_on_app/utils/constants/images_paths.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  double _currentIndicatorDot = 0;
  List<ProductModel>? models;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final heightExcludeAppbar = context.h() - kToolbarHeight;
    final slideShows = [
      _buildSlideImage(ImagePaths.p2),
      _buildSlideImage(ImagePaths.bg),
      _buildSlideImage(ImagePaths.color),
    ];

    return Scaffold(
      drawer: Drawer(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            foregroundColor: kThemeColor,
            backgroundColor: kWhiteColor,
            actions: [
              IconButton(
                  icon: const Icon(CupertinoIcons.search), onPressed: () {}),
              IconButton(
                  icon: const Icon(CupertinoIcons.bell), onPressed: () {}),
              IconButton(
                  icon: const Icon(Icons.logout_rounded),
                  onPressed: () async {
                    await context.read(authenticatePod).signOut();
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil(Routes.auth, (route) => false);
                  }),
            ],
          ),
          _sliverCarousel(heightExcludeAppbar, slideShows),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
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
            ),
          ),
          Consumer(builder: (_, watch, child) {
            return watch(productsSnapshot).when(
                loading: () =>
                    const SliverToBoxAdapter(child: Text(AppStrings.loading)),
                error: (_, err) =>
                    const SliverToBoxAdapter(child: Text("Error")),
                data: (data) {
                  return _sliverStaggeredItems(data, watch);
                });
          }),
        ],
      ),
    );
  }

  Widget _sliverStaggeredItems(data, watch) {
    final products = data.docs;
    return SliverStaggeredGrid.countBuilder(
        itemCount: products.length,
        crossAxisSpacing: 8,
        mainAxisSpacing: 20,
        staggeredTileBuilder: (i) => const StaggeredTile.fit(1),
        crossAxisCount: 2,
        itemBuilder: (ctx, index) {
          final model = watch(productService).parseMaptoModel(products[index]);
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, Routes.detailProduct,
                arguments: model),
            child: ProductContainer(
              imgPath: model.imagesLinks![1],
              title: model.title,
              price: model.price,
              discountPrice: model.discountPrice,
              rating: model.rating,
              hasAddedWishList: false,
            ),
          );
        });
  }

  SliverToBoxAdapter _sliverCarousel(
      double heightExcludeAppbar, List<Stack> slideShows) {
    return SliverToBoxAdapter(
      child: CarouselSlider(
        options: CarouselOptions(
          enableInfiniteScroll: false,
          height: heightExcludeAppbar * .25,
          viewportFraction: 1,
          autoPlay: true,
          autoPlayCurve: Curves.ease,
          onPageChanged: (index, reason) =>
              setState(() => _currentIndicatorDot = index.toDouble()),
        ),
        items: slideShows,
      ),
    );
  }

  Stack _buildSlideImage(String path) {
    return Stack(
      children: [
        Image.asset(
          path,
          fit: BoxFit.cover,
          width: context.w(),
        ),
        _buildSliderDots(),
      ],
    );
  }

  Positioned _buildSliderDots() {
    final double currentdot =
        _currentIndicatorDot != 0 ? _currentIndicatorDot - 1 : 0;
    return Positioned(
      left: 0,
      right: 0,
      bottom: 10,
      child: PlayAnimation<double>(
        tween: Tween(begin: currentdot, end: _currentIndicatorDot),
        duration: const Duration(milliseconds: 500),
        builder: (_, child, value) => DotsIndicator(
          decorator: DotsDecorator(
            activeColor: kMedRed,
            color: kWhiteColor,
            activeSize: const Size(kValue25, kValue8),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kValue10)),
          ),
          position: value,
          dotsCount: 3,
        ),
      ),
    );
  }

  TextButton _buildCategoryButton(BuildContext context, String title) {
    return TextButton(
        style: Theme.of(context)
            .textButtonTheme
            .style
            ?.copyWith(foregroundColor: MaterialStateProperty.all(kThemeColor)),
        onPressed: () {},
        child:
            Text(title, style: const TextStyle(fontWeight: FontWeight.w700)));
  }
}

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
  // ProductContainer(imgPath: ImagePaths.color),
  // ProductContainer(imgPath: ImagePaths.d2),
  // ProductContainer(imgPath: ImagePaths.d3),
  // ProductContainer(imgPath: ImagePaths.d1),
  // ProductContainer(imgPath: ImagePaths.d4),
  // ProductContainer(imgPath: ImagePaths.d5),
  // ProductContainer(imgPath: ImagePaths.d6),
  // ProductContainer(imgPath: ImagePaths.p5),
  // ProductContainer(imgPath: ImagePaths.p6),
  // ProductContainer(imgPath: ImagePaths.authMainImg),
  // ProductContainer(imgPath: ImagePaths.onBoardImg),
];
