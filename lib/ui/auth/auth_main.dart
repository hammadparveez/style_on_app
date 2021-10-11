import 'package:style_on_app/exports.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImagePaths.authMainImg),
            colorFilter: ColorFilter.mode(Colors.black, BlendMode.softLight),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: [
                TextButton(
                    style: ButtonStyle(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                    onPressed: () {},
                    child: Row(
                      children: [
                        Text("Skip"),
                        Icon(Icons.arrow_forward_ios_rounded),
                      ],
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
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
                          onPressed: () {},
                          child: Text("Sign In"),
                        ),
                      ),
                      const SizedBox(height: 10),
                      FullWidthIconButton(
                          icon: SvgPicture.asset(ImagePaths.emailISvgIcon,
                              width: 25),
                          text: const Text(AppStrings.signInWithEmail)),
                      const SizedBox(height: 10),
                      FullWidthIconButton(
                          icon: SvgPicture.asset(ImagePaths.googleIcon,
                              width: 25),
                          text: const Text(AppStrings.signInwithGoogle)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
