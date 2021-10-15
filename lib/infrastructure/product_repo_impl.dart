import 'package:style_on_app/exports.dart';

class ProductRepoImpl extends ProductRepo with FirebaseRepo {
  @override
  Future<T> getProducts<T>() {
   firestore.collection(collectionPath)
  }

}
