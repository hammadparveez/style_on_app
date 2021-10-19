import 'package:style_on_app/exports.dart';
import 'package:style_on_app/ui/auth/components/password_textfield.dart';
import 'package:style_on_app/utils/constants/app_strings.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Heading
    const createAccountHeading = Flexible(
      child: AuthWidgetTitleComponent(heading: AppStrings.createAccount),
    );
    //Main View
    return ScaffoldWithImage(
      bgImgPath: ImagePaths.bg,
      appBar: AuthAppBarWidget(
        onSkipPress: () =>
            Navigator.of(context).pushReplacementNamed(Routes.home),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: context.h(),
          child: Form(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              createAccountHeading,
              _buildFieldsAndBtns(),
            ],
          )),
        ),
      ),
    );
  }

  Widget _buildFieldsAndBtns() {
    //Email Field
    final emailField =
        EmailCustomTextField(controller: TextEditingController());
    //Password Field
    final passwordField =
        PasswordTextField(controller: TextEditingController());
    //Confirm Pass Field
    const confirmPassField = CustomTextfield(
        prefix: Icon(FontAwesomeIcons.key, color: Colors.white),
        hintText: AppStrings.enterConfirmPass);

    return Expanded(
      flex: 2,
      child: Column(
        children: [
          emailField,
          mediumVrtSpacer,
          passwordField,
          mediumVrtSpacer,
          confirmPassField,
          largeVrtSpacer,
          _buildSignUpBtn(),
          mediumVrtSpacer,
          _buildGoogleBtn(),
          _buildAlreadyHaveAccount(),
        ],
      ),
    );
  }

  Center _buildAlreadyHaveAccount() {
    return Center(
      child: TextButton(
        onPressed: () =>
            navigatorKey.currentState?.pushReplacementNamed(Routes.signIn),
        child: const Text(AppStrings.alreadyHaveAccount),
      ),
    );
  }

  FullWidthIconButton _buildGoogleBtn() {
    return FullWidthIconButton(
        icon: SvgPicture.asset(ImagePaths.googleIcon, height: 25),
        text: const Text(AppStrings.signInwithGoogle),
        onTap: () {});
  }

  FullWidthIconButton _buildSignUpBtn() {
    return FullWidthIconButton(
        text: const Text(AppStrings.signUp), onTap: () {});
  }
}
