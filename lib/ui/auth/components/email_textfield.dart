import 'package:style_on_app/exports.dart';

class EmailCustomTextField extends StatelessWidget {
  const EmailCustomTextField({
    Key? key,
    required this.controller,
     this.onValidate,
  }) : super(key: key);
  final TextEditingController controller;
  final String? Function(String?)? onValidate;
  @override
  Widget build(BuildContext context) {
    return  CustomTextfield(
      controller:controller,
      onValidate: onValidate,
        prefix: const Icon(FontAwesomeIcons.user, color: kWhiteColor),
        hintText: AppStrings.enterEmail);
  }
}
