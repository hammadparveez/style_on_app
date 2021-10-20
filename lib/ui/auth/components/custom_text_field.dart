import 'package:style_on_app/exports.dart';
import 'package:style_on_app/exports/ui_exports.dart';

class CustomTextfield extends StatelessWidget {
  final Widget prefix;
  final String hintText;
  final String? Function(String?)? onValidate;
  final TextEditingController controller;
  const CustomTextfield(
      {Key? key,
      required this.controller,
      required this.prefix,
      required this.hintText,
      this.onValidate})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: onValidate,
      style:
          Theme.of(context).textTheme.bodyText1?.copyWith(color: kWhiteColor),
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
          errorBorder:
              const UnderlineInputBorder(borderSide: BorderSide(color: kWhiteColor)),
          errorStyle: const TextStyle(color: kWhiteColor),
          hintText: hintText,
          prefixIcon: prefix,
          isDense: true),
    );
  }
}
