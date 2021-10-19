import 'package:style_on_app/exports.dart';

class ScrollableWithDeviceHeight extends StatelessWidget {
  const ScrollableWithDeviceHeight({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: context.h(),
        child: child,
      ),
    );
  }
}
