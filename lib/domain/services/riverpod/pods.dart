import 'package:style_on_app/exports.dart';

final productService = ChangeNotifierProvider((ref) => ProductService());

final productsSnapshot = StreamProvider((ref) {
  return ref.watch(productService).snapshot();
});

//Local Global Serivce
final localService = LocalService();