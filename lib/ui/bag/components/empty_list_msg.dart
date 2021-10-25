import 'package:style_on_app/exports/ui_exports.dart';

class SliverEmptyListMsg extends StatelessWidget {
  
  final String msg;

  const SliverEmptyListMsg({Key? key, required this.msg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
                child: Center(
              child: Text("Oops! Nothing found in cart",
                  textScaleFactor: 1.5,
                  style: Theme.of(context).textTheme.bodyText1),
            ));
  }
}
