import 'package:style_on_app/exports.dart';

class ScaffoldWithImage extends StatelessWidget {
  const ScaffoldWithImage(
      {Key? key,
      required this.body,
      required this.bgImgPath,
      this.appBar,
      this.filter = const ColorFilter.mode(Colors.black45, BlendMode.darken)})
      : super(key: key);
  final Widget body;
  final AppBar? appBar;
  final String bgImgPath;
  final ColorFilter filter;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: filter,
                image: AssetImage(bgImgPath),
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: body,
        ),
      ),
    );
  }
}
