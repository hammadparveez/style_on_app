import 'package:style_on_app/exports.dart';
import 'package:style_on_app/exports/utils_export.dart';
import 'package:style_on_app/ui/auth/components/password_textfield.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);


  //Main View
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
          _buildSignInForm(),
        ],
      )),
    );
  }

  Column _buildSignInForm() {
    final signInBtn =
        FullWidthIconButton(text: const Text(AppStrings.signIn), onTap: () {});
    final forgetPassBtn = TextButton(
      onPressed: () {},
      child: const Text(AppStrings.forgetPassword),
    );
    final signUpBtn = TextButton(
        onPressed: () {
          navigatorKey.currentState!.pushReplacementNamed(Routes.signUp);
        },
        child: const Text(AppStrings.dontHaveAccount));
    return Column(
      children: [
        EmailCustomTextField(controller: TextEditingController()),
        PasswordTextField(controller: TextEditingController()),
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
