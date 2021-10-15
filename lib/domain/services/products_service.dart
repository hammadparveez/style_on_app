import 'package:style_on_app/exports.dart';

abstract class ProductServiceNotifier extends BaseNotifier {
  ProductRepo? productRepo;
  Future<T?> getProducts<T>();
}

class ProductService extends ProductServiceNotifier {
  @override
  Future<T?> getProducts<T>() async {}
}
