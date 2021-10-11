import 'package:style_on_app/exports.dart';
import 'package:style_on_app/ui/auth/components/password_textfield.dart';
import 'package:style_on_app/utils/constants/app_strings.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithImage(
      bgImgPath: ImagePaths.bg,
      appBar: AuthAppBarWidget(
        onSkipPress: () {},
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: context.h(),
          child: Form(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Flexible(
                child:
                    AuthWidgetTitleComponent(heading: AppStrings.createAccount),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    EmailCustomTextField(controller: TextEditingController()),
                    const SizedBox(height: 10),
                    PasswordTextField(controller: TextEditingController()),
                    const SizedBox(height: 10),
                    const CustomTextfield(
                        prefix: Icon(FontAwesomeIcons.key, color: Colors.white),
                        hintText: AppStrings.enterConfirmPass),
                    const SizedBox(height: 20),
                    FullWidthIconButton(
                        text: const Text("Sign Up"), onTap: () {}),
                    const SizedBox(height: 10),
                    FullWidthIconButton(
                        icon:
                            SvgPicture.asset(ImagePaths.googleIcon, height: 25),
                        text: const Text("Login With Google"),
                        onTap: () {}),
                    Center(
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed(Routes.signIn);
                          },
                          child: Text("Already have an account? Login In")),
                    ),
                  ],
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
