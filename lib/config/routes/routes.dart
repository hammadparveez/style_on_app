import 'package:style_on_app/exports.dart';
import 'package:style_on_app/ui/address/address_screen.dart';
import 'package:style_on_app/ui/bag/cart_screen.dart';

import 'package:style_on_app/ui/detail_page/product_detail_page.dart';
import 'package:style_on_app/ui/payment/payment_screen.dart';

class Routes {
  static const onBoard = "onboard";
  static const home = "home";
  static const main = "mainview";
  static const signIn = "signin";
  static const signUp = "signup";
  static const auth = "auth";
  static const listProducts = "list_products";
  static const detailProduct = "detail_product";
  static const order = "order";
  static const checkout = "checkout";
  static const address = "address";
  static const search = "search";
  static const cart = "cart";
  static const wishlist = "wishlist";

  static Route onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (_) {
      switch (settings.name) {
        case main:
          return const MainScreen();
        case auth:
          return const AuthScreen();
        case detailProduct:
          final model = (settings.arguments as ProductModel);
          return ProductDetailPage(model: model);
        case cart:
          return const CartScreen();
        case address:
          return Overlay(
            initialEntries: [OverlayEntry(builder: (_) => AddressScreen())],
          );
        case checkout:
          return const PaymentScreen();
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
