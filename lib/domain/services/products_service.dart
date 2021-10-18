import 'dart:async';

import 'package:style_on_app/domain/factory/product_factory.dart';
import 'package:style_on_app/domain/shared/product_factory_type.dart';
import 'package:style_on_app/exports.dart';

abstract class ProductServiceNotifier extends BaseNotifier {
  ProductRepo? productRepo;
  Future<T?> getInitialProducts<T>();
}

abstract class MapToModelParser {
  R parseMaptoModel<R, V>(V data);
}

class ProductService extends ProductServiceNotifier
    implements MapToModelParser {
  final ProductRepo repository =
      ProductRepoFactory.create(ProductRepoFactoryType.initialProducts);
  List<ProductModel> products = [];
  @override
  Future<T?> getInitialProducts<T>() async {
    products = await repository.getProducts();
    notifyListeners();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> snapshot() {
    final Stream<QuerySnapshot<Map<String, dynamic>>> snapshot =
        repository.itemSnapshot();

    return snapshot;
  }

  @override
  R parseMaptoModel<R, V>(V data) {
    final _data = data as QueryDocumentSnapshot<Map<String, dynamic>>;
    return ProductModel.toJson(_data.data()) as R;
  }
}
