
import 'package:style_on_app/exports.dart';

class EmailCustomTextField extends StatelessWidget {
  const EmailCustomTextField({
    Key? key,
    required  this.controller,
  }) : super(key: key);
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return const CustomTextfield(
        prefix: Icon(FontAwesomeIcons.user, color: Colors.white),
        hintText: AppStrings.enterEmail);
  }
}