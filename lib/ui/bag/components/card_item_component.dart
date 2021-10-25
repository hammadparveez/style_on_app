 import 'package:style_on_app/exports/ui_exports.dart';

class CardItemsComponents extends StatelessWidget {
  final BoxConstraints constraints;
  final Widget child;

  const CardItemsComponents(
      {Key? key, required this.constraints, required this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return child;
  }
}