import 'package:flutter/cupertino.dart';
import 'package:style_on_app/exports.dart';
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

  @override
  Widget build(BuildContext context) {
    final heightExcludeAppbar = context.h() - kToolbarHeight;
    return Scaffold(
      appBar: AppBar(),
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
                        child: LayoutBuilder(builder: (context, c) {
                          debugPrint("C $c");
                          return StaggeredGridView.countBuilder(
                            crossAxisCount: 4,
                            staggeredTileBuilder: (i) {
                              return StaggeredTile.count(3, 1);
                            },
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 2,
                            itemBuilder: (_, index) {
                              return Container(
                                alignment: Alignment.center,
                                color: Colors.green,
                                child: Text("$index",
                                    style: TextStyle(fontSize: 20)),
                              );
                            },
                          );
                        }),
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
