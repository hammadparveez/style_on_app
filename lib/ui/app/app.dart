import 'package:flutter/cupertino.dart';
import 'package:style_on_app/exports.dart';
import "package:style_on_app/exports/ui_exports.dart";

final naigatorKey = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StyleO',
      theme: ThemeData(
        fontFamily: 'Raleway',
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            foregroundColor: MaterialStateProperty.all(Colors.black87),
            textStyle: MaterialStateProperty.all(
                const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
            // padding:
            //     MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 8)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            ),
          ),
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          headline2: TextStyle(
            fontSize: 35,
            color: Colors.white,
          ),
        ),
      ),
      navigatorKey: naigatorKey,
      onGenerateRoute: Routes.onGenerateRoute,
      initialRoute: Routes.onBoard,
    );
  }
}
