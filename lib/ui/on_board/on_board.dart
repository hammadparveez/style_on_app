import 'package:style_on_app/exports/ui_exports.dart';

class OnBoard extends StatelessWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint(
        "${MediaQuery.of(context).devicePixelRatio} && ${MediaQuery.of(context).size}");
    return const Scaffold(
      body: Center(child: Text("Hello")),
    );
  }
}
