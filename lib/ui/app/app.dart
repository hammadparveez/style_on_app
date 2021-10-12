import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:style_on_app/exports.dart';
import "package:style_on_app/exports/ui_exports.dart";

final naigatorKey = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  final _underLineBorder =
      const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white));
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StyleO',
      theme: ThemeData(
        fontFamily: 'Roboto',
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
          headline3: TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
          bodyText1:
              TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          subtitle2: TextStyle(
            height: 1.2,
            overflow: TextOverflow.ellipsis,
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
          textStyle:
              MaterialStateProperty.all(TextStyle(fontWeight: FontWeight.w400)),
          foregroundColor: MaterialStateProperty.all(Colors.white),
        )),
        inputDecorationTheme: InputDecorationTheme(
            border: _underLineBorder,
            enabledBorder: _underLineBorder,
            focusedBorder: _underLineBorder,
            hintStyle: const TextStyle(
              color: Colors.white,
            )),
      ),
      navigatorKey: naigatorKey,
      onGenerateRoute: Routes.onGenerateRoute,
      initialRoute: Routes.onBoard,
    );
  }
}
