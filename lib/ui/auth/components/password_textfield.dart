import 'package:style_on_app/exports.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return const CustomTextfield(
        prefix: Icon(FontAwesomeIcons.lock, color: kWhiteColor),
        hintText: AppStrings.enterPassword);
  }
}
