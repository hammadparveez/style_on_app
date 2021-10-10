import "package:style_on_app/exports/ui_exports.dart";

final naigatorKey = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      navigatorKey: naigatorKey,
      onGenerateRoute: Routes.onGenerateRoute,
      initialRoute: Routes.onBoard,
    );
  }
}
