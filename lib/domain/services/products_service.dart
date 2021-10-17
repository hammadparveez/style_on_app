import 'package:style_on_app/exports.dart';

abstract class ProductServiceNotifier extends BaseNotifier {
  ProductRepo? productRepo;
  Future<T?> getInitialProducts<T>();
}

class ProductService extends ProductServiceNotifier {
  final ProductRepo repo = ProductRepoImpl();
  List<ProductModel> products = [];
  @override
  Future<T?> getInitialProducts<T>() async {
    products = await repo.getProducts();
    
    notifyListeners();
  }
}
