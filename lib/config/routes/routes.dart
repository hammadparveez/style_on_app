import 'package:style_on_app/exports.dart';
import 'package:style_on_app/ui/detail_page/product_detail_page.dart';

class Routes {
  static const onBoard = "onboard";
  static const home = "home";
  static const signIn = "signin";
  static const signUp = "signup";
  static const auth = "auth";
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
          return MainScreen();
        case auth:
          return const AuthScreen();
        case detailProduct:
          final model = (settings.arguments as ProductModel);
          return  ProductDetailPage(model:model);
        case signUp:
          return const SignUp();
        case signIn:
          return const SignIn();
        default:
          return const OnBoard();
      }
    });
  }
}
