import 'package:style_on_app/exports.dart';

class FullWidthIconButton extends StatelessWidget {
  final Widget? icon;
  final Widget text;
  final Color? buttonColor;
  final VoidCallback onTap;
  const FullWidthIconButton(
      {Key? key,
      this.icon,
      required this.text,
      required this.onTap,
      this.buttonColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: ElevatedButton(
        onPressed: onTap,
        style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
              backgroundColor: MaterialStateProperty.all(buttonColor),
              foregroundColor: buttonColor != null
                  ? MaterialStateProperty.all(kWhiteColor)
                  : null,
            ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? const SizedBox(),
            icon != null ? mediumHztSpacer : const SizedBox(),
            text,
          ],
        ),
      ),
    );
  }
}
