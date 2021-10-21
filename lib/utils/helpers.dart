import 'package:style_on_app/exports/ui_exports.dart';

double parseString(String value) => int.parse(value).toDouble();

double calcDiscount(String total, String discount) {
  final price = parseString(total);
  final disCountPrice = parseString(discount);
  return (disCountPrice / price) * 100;
}

Future<T?> routeReplaceAndRemove<T>(String name, [T? resault]) async {
  return await navigatorKey.currentState
      ?.pushNamedAndRemoveUntil(name, (route) => false, arguments: resault);
}
Future<T?> routeReplace<T>(String name, [T? resault]) async {
  return await navigatorKey.currentState
      ?.pushReplacementNamed(name, arguments: resault);
}
