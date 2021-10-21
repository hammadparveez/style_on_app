import 'dart:developer';

import 'package:style_on_app/domain/services/auth_service.dart';
import 'package:style_on_app/domain/services/riverpod/pods.dart';
import 'package:style_on_app/exports.dart';
import 'package:style_on_app/ui/auth/components/password_textfield.dart';
import 'package:style_on_app/utils/constants/app_strings.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController emailController,
      passwordController,
      confirmPassController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPassController = TextEditingController();
  }

  @override
  dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }

  String? _emailValidator(String? email) {
    if (email!.isEmpty) return "Please enter an Email";
    var isEmail = GetUtils.isEmail(email);
    if (!isEmail) return "Enter a valid Email";
  }

  String? _passwordValidator(String? password) {
    if (password!.isEmpty) return "Enter a password";
    var isCorrectPassword = GetUtils.isUsername(password);
    if (!isCorrectPassword) return "Enter a valid Password";
  }

  String? _confirmPasswordValidator(String? confirmPass) {
    if (confirmPass!.isEmpty) return "Please enter a confirm Password";
    if (passwordController.text != confirmPass) {
      return "Password does not match";
    }
  }

  _onGoogleSignIn() async {
    await context.read(authenticatePod).signInBy(ThirdPartAuthType.google);
    routeReplaceAndRemove(Routes.main);
  }

  _onSignUp() async {
    var isValidated = _formKey.currentState?.validate() ?? false;
    if (isValidated) {
      await context
          .read(authenticatePod)
          .createAccount(emailController.text, passwordController.text);
      routeReplaceAndRemove(Routes.main);
    }
  }

  @override
  Widget build(BuildContext context) {
    //Heading
    const createAccountHeading = Flexible(
      child: AuthWidgetTitleComponent(heading: AppStrings.createAccount),
    );
    //Main View

    return ScaffoldWithImage(
      bgImgPath: ImagePaths.bg,
      appBar: AuthAppBarWidget(),
      body: SingleChildScrollView(
        child: SizedBox(
          height: context.h(),
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  createAccountHeading,
                  _buildFieldsAndBtns(context),
                ],
              )),
        ),
      ),
    );
  }

  Widget _buildFieldsAndBtns(BuildContext ctx) {
    //Email Field
    final emailField = EmailCustomTextField(
        controller: emailController, onValidate: _emailValidator);
    //Password Field
    final passwordField = PasswordTextField(
        controller: passwordController, onValidate: _passwordValidator);
    //Confirm Pass Field
    final confirmPassField = CustomTextfield(
        onValidate: _confirmPasswordValidator,
        controller: confirmPassController,
        prefix: const Icon(FontAwesomeIcons.key, color: Colors.white),
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
          _buildSignUpBtn(ctx),
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
        onPressed: () => routeReplace(Routes.signIn),
        child: const Text(AppStrings.alreadyHaveAccount),
      ),
    );
  }

  FullWidthIconButton _buildGoogleBtn() {
    return FullWidthIconButton(
        icon: SvgPicture.asset(ImagePaths.googleIcon, height: 25),
        text: const Text(AppStrings.signInwithGoogle),
        onTap: _onGoogleSignIn);
  }

  FullWidthIconButton _buildSignUpBtn(BuildContext ctx) {
    return FullWidthIconButton(
        text: const Text(AppStrings.signUp), onTap: _onSignUp);
  }
}
