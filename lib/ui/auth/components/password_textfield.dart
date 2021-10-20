import 'package:style_on_app/exports.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    Key? key,
    required this.controller,
    this.onValidate,
  }) : super(key: key);
  final TextEditingController controller;
  final String? Function(String?)? onValidate;
  @override
  Widget build(BuildContext context) {
    return CustomTextfield(
      controller:controller,
      onValidate: onValidate,
        prefix:const Icon(FontAwesomeIcons.lock, color: kWhiteColor),
        hintText: AppStrings.enterPassword);
  }
}
