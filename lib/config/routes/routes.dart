import 'package:style_on_app/exports/ui_exports.dart';

class Routes {
  static const onBoard = "onboard";
  static const home = "home";
  static const login = "login";
  static const signup = "signup";
  static const main = "main";
  static const listProducts = "list_products";
  static const detailProduct = "detail_product";
  static const order = "order";
  static const checkout = "checkout";
  static const search = "search";
  static const cart = "cart";
  static const wishlist = "wishlist";

  static Route onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (_) {
      switch (settings.name) {
        case home:
          return const Home();
          default:
          return const OnBoard();
      }
    });
  }
}
