import 'package:style_on_app/exports.dart';

//ImagePaths.authMainImg
class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const styleOTitle = StyleOTitleWidget();
    
    final signUpText = Text(
      AppStrings.signUpDesc,
      style: Theme.of(context).textTheme.headline3,
    );

    final signInBtn = FullWidthIconButton(
      onTap: () => Navigator.of(context).pushNamed(Routes.home),
      text: const Text(AppStrings.signIn),
    );

    final signUpBtn = FullWidthIconButton(
        onTap: () => Navigator.of(context).pushNamed(Routes.signUp),
        icon: SvgPicture.asset(ImagePaths.emailISvgIcon, width: kValue25),
        text: const Text(AppStrings.signInWithEmail));

    final googleSignInBtn = FullWidthIconButton(
        onTap: () {},
        icon: SvgPicture.asset(ImagePaths.googleIcon, width: kValue25),
        text: const Text(AppStrings.signInwithGoogle));

    //Main View
    return ScaffoldWithImage(
      bgImgPath: ImagePaths.authMainImg,
      appBar: AuthAppBarWidget(
        onSkipPress: () => navigatorKey.currentState?.pushNamed(Routes.home),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          styleOTitle,
          signUpText,
          largeVrtSpacer,
          Column(
            children: [
              mediumVrtSpacer,
              signInBtn,
              mediumVrtSpacer,
              signUpBtn,
              mediumVrtSpacer,
              googleSignInBtn,
            ],
          ),
        ],
      ),
    );
  }
}
