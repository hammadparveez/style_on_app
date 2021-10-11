import 'package:style_on_app/exports.dart';
import 'package:style_on_app/exports/utils_export.dart';
import 'package:style_on_app/ui/auth/components/password_textfield.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithImage(
      bgImgPath: ImagePaths.bg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_rounded)),
      ),
      body: SingleChildScrollView(
          child: SizedBox(
        height: context.h(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuthWidgetTitleComponent(heading: AppStrings.signIn),
            Column(
              children: [
                EmailCustomTextField(controller: TextEditingController()),
                PasswordTextField(controller: TextEditingController()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FormField<bool>(
                      builder: (state) => Row(
                        children: [
                          Checkbox(
                            checkColor: Colors.black54,
                            fillColor: MaterialStateProperty.all(Colors.white),
                            value: state.value ?? false,
                            onChanged: (value) {
                              state.didChange(value);
                            },
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            visualDensity: VisualDensity.compact,
                          ),
                          Text(AppStrings.rememberMe,
                              style: Theme.of(context).textTheme.bodyText1),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(AppStrings.forgetPassword),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                FullWidthIconButton(
                    text: Text(AppStrings.signIn), onTap: () {}),
                const SizedBox(height: 10),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed(Routes.signUp);
                    },
                    child: Text(AppStrings.dontHaveAccount))
              ],
            ),
          ],
        ),
      )),
    );
  }
}
