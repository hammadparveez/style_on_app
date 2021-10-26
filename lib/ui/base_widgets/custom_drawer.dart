import 'dart:developer';

import 'package:flutter/cupertino.dart';

import 'package:style_on_app/exports/ui_exports.dart';
import 'package:style_on_app/exports/utils_export.dart';

List<Widget> _items = [
  CustomListTile(
    icon: CupertinoIcons.person,
    onTap: () {},
    text: AppStrings.profile,
  ),
  CustomListTile(
    icon: CupertinoIcons.bell,
    onTap: () {},
    text: AppStrings.notifications,
  ),
  CustomListTile(
    icon: CupertinoIcons.search,
    onTap: () {},
    text: AppStrings.explore,
  ),
  CustomListTile(
      icon: CupertinoIcons.book, onTap: () {}, text: AppStrings.orders),
  CustomListTile(
    icon: CupertinoIcons.settings,
    onTap: () {},
    text: AppStrings.settings,
  ),
  CustomListTile(
    icon: CupertinoIcons.info,
    onTap: () {},
    text: AppStrings.about,
  ),
];

class CustomDrawerBody extends StatelessWidget {
  const CustomDrawerBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: kThemeColor,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(kPadding20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: context.h(.12),
                child: DrawerHeader(
                  padding: EdgeInsets.zero,
                  child: Material(
                    type: MaterialType.transparency,
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(kValue10),
                    child: InkResponse(
                      radius: kValue20,
                      child: ListTile(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: kPaddingSmall),
                        onTap: () {
                          log("Tapped");
                        },
                        leading: Material(
                          clipBehavior: Clip.antiAlias,
                          type: MaterialType.transparency,
                          shape: const CircleBorder(),
                          child: Ink.image(
                            padding: EdgeInsets.zero,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                            image: AssetImage(ImagePaths.bg),
                          ),
                        ),
                        minVerticalPadding: 0,
                        subtitle: FittedBox(
                            child: Text("hammadpervez6@gmail.com",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    ?.copyWith(color: kWhiteColor))),
                        title: Text("Hammad Parveez",
                            style: TextStyle(color: kWhiteColor)),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  children: [..._items],
                ),
              ),
              CustomListTile(
                  icon: Icons.logout, onTap: () {}, text: AppStrings.signOut),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final IconData icon;
  const CustomListTile({
    Key? key,
    required this.text,
    required this.onTap,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: kPadding15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kValue25),
        color: kWhiteColor,
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadius.circular(kValue25),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kValue10, vertical: kValue4),
            child: Row(
              children: [
                Icon(icon),
                largeHztSpacer,
                Text(
                  text,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: kThemeColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
