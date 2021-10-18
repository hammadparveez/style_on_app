import 'dart:convert';

import 'package:style_on_app/domain/shared/firebase_collections.dart';
import 'package:style_on_app/exports.dart';

class ProductRepoImpl extends ProductRepo with FirebaseRepo {
  List<ProductModel> model = [];

  CollectionReference<Map<String, dynamic>>? _productCollectionRef;

  CollectionReference<Map<String, dynamic>> get _getProductCollection {
    if (_productCollectionRef != null) {
      return _productCollectionRef!;
    }
    return _productCollectionRef = firestore
        .collection(kCollectionShop)
        .doc(kDocProduct)
        .collection(kCollectionProduct);
  }

  @override
  Future<T?> getProducts<T>([int? limit]) async {
    model.clear();
    final qs = await _getProductCollection.get();
    for (var doc in qs.docs) {
      model.add(ProductModel.toJson(doc.data()));
    }
    return model as T;
  }

  @override
  itemSnapshot() {
    return _getProductCollection.snapshots();
  }
}
