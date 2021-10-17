import 'dart:convert';

import 'package:style_on_app/exports.dart';

class ProductRepoImpl extends ProductRepo with FirebaseRepo {
  final shop = "shop", products = "products";
  List<ProductModel> model = [];
  @override
  Future<T?> getProducts<T>() async {
    model = [];
    final qs = await firestore
        .collection(shop)
        .doc(products)
        .collection(products)
        .get();
    for (var doc in qs.docs) {
      final imagesLinks =
          await jsonDecode(doc.data()['images']) as List<dynamic>?;
      debugPrint("Images Link ${imagesLinks.runtimeType}");
      model.add(ProductModel.toJson(doc.data())..imagesLinks = imagesLinks);
    }
    return model as T;
  }
}
