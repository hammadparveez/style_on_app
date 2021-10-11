import 'package:style_on_app/exports.dart';

//ImagePaths.authMainImg
class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithImage(
      bgImgPath: ImagePaths.authMainImg,
      appBar: AuthAppBarWidget(
        onSkipPress: () {
          naigatorKey.currentState?.pushNamed(Routes.home);
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const StyleOTitleWidget(),
          Text(AppStrings.signUpDesc,
              style: Theme.of(context).textTheme.headline3),
          const SizedBox(height: 20),
          Column(
            children: [
              FractionallySizedBox(
                widthFactor: 1,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(Routes.signIn);
                  },
                  child: Text("Sign In"),
                ),
              ),
              const SizedBox(height: 10),
              FullWidthIconButton(
                  onTap: () => Navigator.of(context).pushNamed(Routes.signUp),
                  icon: SvgPicture.asset(ImagePaths.emailISvgIcon, width: 25),
                  text: const Text(AppStrings.signInWithEmail)),
              const SizedBox(height: 10),
              FullWidthIconButton(
                  onTap: () {},
                  icon: SvgPicture.asset(ImagePaths.googleIcon, width: 25),
                  text: const Text(AppStrings.signInwithGoogle)),
            ],
          ),
        ],
      ),
    );
  }
}
