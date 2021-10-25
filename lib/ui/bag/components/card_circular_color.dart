import 'package:hexcolor/hexcolor.dart';
import 'package:style_on_app/exports.dart';

class CardCircularColor extends StatelessWidget {
  const CardCircularColor({
    Key? key,
    required this.hexColor,
  }) : super(key: key);

  final String hexColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kValue15,
      height: kValue15,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: HexColor(hexColor),
      ),
    );
  }
}
