


import 'package:style_on_app/exports.dart';

class CenteredAnimatedLoader extends StatelessWidget {
  const CenteredAnimatedLoader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: MirrorAnimation<double>(
            tween: Tween(begin: 0, end: 50),
            builder: (context, child, value) {
              return Container(
                margin: EdgeInsets.only(top: value),
                child: const CircularProgressIndicator(
                  backgroundColor: kThemeColor,
                  valueColor: AlwaysStoppedAnimation<Color>(kMedRed),
                ),
              );
            }));
  }
}