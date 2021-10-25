import 'package:flutter/cupertino.dart';
import 'package:style_on_app/domain/services/riverpod/pods.dart';
import 'package:style_on_app/exports.dart';

class DefaultAppBar extends AppBar {
  final VoidCallback? onFirstTap, onSecondTap, onThirdTap;
  final IconData? firstIcon, secondIcon;
  final Widget? replaceCartWidget;
  DefaultAppBar(
      {Key? key,
      this.onFirstTap,
      this.onSecondTap,
      this.onThirdTap,
      this.firstIcon,
      this.secondIcon,
      this.replaceCartWidget})
      : super(
          key: key,
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          actions: [
            firstIcon == null
                ? const SizedBox()
                : IconButton(icon: Icon(firstIcon), onPressed: onFirstTap),
            secondIcon == null
                ? const SizedBox()
                : IconButton(icon: Icon(secondIcon), onPressed: onSecondTap),
            replaceCartWidget ??
                _cartIconWithBadge(CupertinoIcons.bag, onThirdTap),
          ],
        );

  static Widget _cartIconWithBadge(IconData icon, [VoidCallback? onTap]) {
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
              child: Consumer(builder: (context, watch, child) {
                var itemsLength = watch(bagService).items.length;
                var itemCount = itemsLength > 99 ? "99+" : itemsLength;
                return Text("$itemCount",
                    style: const TextStyle(
                      color: kWhiteColor,
                      fontSize: kfontSmallest11,
                      fontWeight: FontWeight.w600,
                    ));
              }),
            ),
          ),
        ],
      ),
    );
  }
}
