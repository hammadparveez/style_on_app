import 'package:style_on_app/exports.dart';

class FullWidthIconButton extends StatelessWidget {
  
  final Widget icon;
  final Widget text;

  const FullWidthIconButton({Key? key, required this.icon, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: ElevatedButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 10),
            text,
          ],
        ),
      ),
    );
  }
}
