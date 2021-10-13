import 'package:style_on_app/exports.dart';
import 'package:style_on_app/exports/ui_exports.dart';

class CustomTextfield extends StatelessWidget {
  final Widget prefix;
  final String hintText;

  const CustomTextfield(
      {Key? key, required this.prefix, required this.hintText})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
          hintText: hintText, prefixIcon: prefix, isDense: true),
    );
  }
}