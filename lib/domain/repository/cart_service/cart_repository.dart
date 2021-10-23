import 'package:style_on_app/domain/model/bag_model.dart';
import 'package:style_on_app/domain/model/product/product_model.dart';

abstract class BagRepository {
  addItem(BagModel model);
  deleteItem(String productID);
  updateItem(String productID);
  deleteAll();
  
  Future<List<BagModel>> fetchAllItems();
}
