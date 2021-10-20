import 'package:style_on_app/exports.dart';

class AuthAppBarWidget extends AppBar {
  final VoidCallback? onSkipPress;
  final VoidCallback? onBackPress;
  final bool showBackPress;
  AuthAppBarWidget({
    Key? key,
    this.onSkipPress,
    this.onBackPress,
    this.showBackPress = true,
  }) : super(
          key: key,
          backgroundColor: Colors.transparent,
          leading: showBackPress
              ? IconButton(
                  onPressed: () =>
                      onBackPress ?? navigatorKey.currentState?.pop(),
                  icon: const Icon(Icons.arrow_back_ios_new))
              : null,
          elevation: 0,
          actions: onSkipPress == null
              ? null
              : [
                  TextButton(
                      style: const ButtonStyle(
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                      onPressed: onSkipPress,
                      child: Row(
                        children: const [
                          Text(AppStrings.skip),
                          Icon(Icons.arrow_forward_ios_rounded),
                        ],
                      ))
                ],
        );
}
