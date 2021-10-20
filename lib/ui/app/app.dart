import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:style_on_app/exports.dart';
import "package:style_on_app/exports/ui_exports.dart";
import 'package:style_on_app/utils/constants/style.dart';

final navigatorKey = GlobalKey<NavigatorState>();

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
        textTheme: TextTheme(
          headline1: biggestBTextStyle,
          headline2: bigBTextStyle,
          headline3: bigBTextStyle.copyWith(fontSize: kfont25),
          bodyText1: defaultTextStyle,
          bodyText2: medTextStyle,
          subtitle2: smallestBTextStyle.copyWith(

              // height: 1.2,
              // overflow: TextOverflow.ellipsis,
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
      navigatorKey: navigatorKey,
      onGenerateRoute: Routes.onGenerateRoute,
      initialRoute: Routes.onBoard,
    );
  }
}
