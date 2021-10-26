import 'dart:developer';

import 'package:style_on_app/domain/services/riverpod/pods.dart';
import 'package:style_on_app/exports.dart';
import 'package:style_on_app/ui/base_widgets/custom_animated_button.dart';

class BagScreenBottomBotton extends StatelessWidget {
  const BagScreenBottomBotton({
    Key? key,
  }) : super(key: key);

  _deleteCarts(BuildContext context) {
    context.read(bagService).deleteAllCarts();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Consumer(builder: (context, watch, child) {
                final _bagProvider = watch(bagService);
                return TextButton(
                  onPressed: _bagProvider.items.isEmpty
                      ? null
                      : () => _deleteCarts(context),
                  child: Text(
                      _bagProvider.items.isEmpty
                          ? AppStrings.nothingToClear
                          : AppStrings.clearAll,
                      style: Theme.of(context).textTheme.subtitle2),
                );
              }),
              Row(
                children: [
                  Text("Total: ", style: Theme.of(context).textTheme.subtitle2),
                  Consumer(builder: (context, watch, child) {
                    return Text("Rs: ${watch(bagService).totalAmount}");
                  }),
                ],
              ),
            ],
          ),
          Consumer(builder: (context, watch, child) {
            var isEmpty = watch(bagService).items.isEmpty;
            return CustomAnimatedButton(
                backwardText: AppStrings.addSthToCart,
                forwardText: AppStrings.checkoutImmediately,
                showBackward: isEmpty,
                showForward: !isEmpty,
                onBackwardTap: () {
                  log("Bakward");
                },
                onForwardTap: () {
                  Navigator.pushNamed(context, Routes.address);
                });
          }),
        ],
      ),
    );
  }
}
