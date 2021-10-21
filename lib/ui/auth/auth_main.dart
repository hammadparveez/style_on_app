import 'dart:async';
import 'dart:developer';

import 'package:style_on_app/domain/services/auth_service.dart';
import 'package:style_on_app/domain/services/riverpod/pods.dart';

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
      onTap: () => Navigator.of(context).pushNamed(Routes.signIn),
      text: const Text(AppStrings.signIn),
    );

    final signUpBtn = FullWidthIconButton(
        onTap: () => Navigator.of(context).pushNamed(Routes.signUp),
        icon: SvgPicture.asset(ImagePaths.emailISvgIcon, width: kValue25),
        text: const Text(AppStrings.signInWithEmail));

    final googleSignInBtn = FullWidthIconButton(
        onTap: () async {
          await context
              .read(authenticatePod)
              .signInBy(ThirdPartAuthType.google);
          Navigator.of(context)
              .pushNamedAndRemoveUntil(Routes.main, (route) => false);
        },
        icon: SvgPicture.asset(ImagePaths.googleIcon, width: kValue25),
        text: const Text(AppStrings.signInwithGoogle));

    return ScaffoldWithImage(
      bgImgPath: ImagePaths.authMainImg,
      appBar: AuthAppBarWidget(
        showBackPress: false,
        //onSkipPress: () => navigatorKey.currentState?.pushNamed(Routes.main),
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

    //Main View
  }
}
