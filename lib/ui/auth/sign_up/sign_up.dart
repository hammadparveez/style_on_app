import 'package:style_on_app/exports.dart';
import 'package:style_on_app/utils/constants/app_strings.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithImage(
      bgImgPath: ImagePaths.bg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Form(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const StyleOTitleWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(AppStrings.createAccount,
                style: Theme.of(context).textTheme.headline3),
          ),
          const CustomTextfield(
              prefix: Icon(FontAwesomeIcons.user, color: Colors.white),
              hintText: AppStrings.enterEmail),
          const SizedBox(height: 10),
          const CustomTextfield(
              prefix: Icon(FontAwesomeIcons.key, color: Colors.white),
              hintText: AppStrings.enterPassword),
          const SizedBox(height: 10),
          const CustomTextfield(
              prefix: Icon(FontAwesomeIcons.lock, color: Colors.white),
              hintText: AppStrings.enterConfirmPass),
          const SizedBox(height: 20),
          FullWidthIconButton(
              icon: Icon(Icons.next_plan_outlined),
              text: Text("Sign Up"),
              onTap: () {}),
          const SizedBox(height: 10),
          FullWidthIconButton(
              icon: SvgPicture.asset(ImagePaths.googleIcon, height: 25),
              text: Text("Login With Google"),
              onTap: () {}),
          Center(
            child: TextButton(
                onPressed: () {},
                child: Text("Already have an account? Login In")),
          ),
        ],
      )),
    );
  }
}

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
      decoration: InputDecoration(hintText: hintText, prefixIcon: prefix),
    );
  }
}
