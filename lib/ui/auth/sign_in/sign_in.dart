import 'dart:async';

import 'package:get/get.dart';
import 'package:style_on_app/domain/services/riverpod/pods.dart';
import 'package:style_on_app/exports.dart';
import 'package:style_on_app/exports/utils_export.dart';
import 'package:style_on_app/ui/auth/components/password_textfield.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController emailController, passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  String? _emailValidator(String? email) {
    if (email!.isEmpty) return "Enter an Email";
    var isEmail = GetUtils.isEmail(email);
    if (!isEmail) return "Enter a valid Email";
  }

  String? _passwordValidator(String? password) {
    if (password!.isEmpty) return "Enter a password";
  }

  _onSignIn() async {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (isValid) {
      await context
          .read(authenticatePod)
          .signIn(emailController.text, passwordController.text);
      routeReplaceAndRemove(Routes.main);
    }
  }

  @override
  Widget build(BuildContext context) {
    const heading = AuthWidgetTitleComponent(heading: AppStrings.signIn);
    return ScaffoldWithImage(
      bgImgPath: ImagePaths.bg,
      appBar: AuthAppBarWidget(),
      body: ScrollableWithDeviceHeight(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          heading,
          Form(key: _formKey, child: _buildSignInForm()),
        ],
      )),
    );
  }

  Column _buildSignInForm() {
    final signInBtn = FullWidthIconButton(
        text: const Text(AppStrings.signIn), onTap: _onSignIn);
    final forgetPassBtn = TextButton(
      onPressed: () {},
      child: const Text(AppStrings.forgetPassword),
    );
    final signUpBtn = TextButton(
        onPressed: () => routeReplace(Routes.signUp),
        child: const Text(AppStrings.dontHaveAccount));
    return Column(
      children: [
        EmailCustomTextField(
            controller: emailController, onValidate: _emailValidator),
        PasswordTextField(
            controller: passwordController, onValidate: _passwordValidator),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [_buildCheckBoxField(), forgetPassBtn],
        ),
        mediumVrtSpacer,
        signInBtn,
        signUpBtn,
      ],
    );
  }

  FormField<bool> _buildCheckBoxField() {
    final rememberMe = Text(
      AppStrings.rememberMe,
      style: Theme.of(navigatorKey.currentContext!)
          .textTheme
          .bodyText2
          ?.copyWith(color: kWhiteColor),
    );
    return FormField<bool>(
      builder: (state) => Row(
        children: [
          Checkbox(
            checkColor: Colors.black54,
            fillColor: MaterialStateProperty.all(Colors.white),
            value: state.value ?? false,
            onChanged: (value) {
              state.didChange(value);
            },
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
          ),
          rememberMe
        ],
      ),
    );
  }
}
