import 'package:style_on_app/exports/pkgs_exports.dart';
import 'package:style_on_app/exports/ui_exports.dart';
import 'package:style_on_app/exports/utils_export.dart';

class BaseBagView extends StatefulWidget {
  //final Widget appBarAction;

  @override
  _BaseBagViewState createState() => _BaseBagViewState();
}

class _BaseBagViewState extends State<BaseBagView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(kPadding10),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(),
          ],
        ),
      ),
    );
  }
}
