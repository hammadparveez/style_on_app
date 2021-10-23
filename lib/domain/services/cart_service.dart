import 'dart:developer';

import 'package:style_on_app/domain/model/bag_model.dart';
import 'package:style_on_app/domain/repository/cart_service/cart_repository.dart';
import 'package:style_on_app/domain/services/local_service.dart';
import 'package:style_on_app/domain/services/riverpod/pods.dart';
import 'package:style_on_app/exports/ui_exports.dart';

class CartService extends ChangeNotifier {
  final BagRepository _cartRepository;
  LocalCartSerivce _localCartSerivce = LocalCartSerivce();
  List<BagModel> items = [];
  CartService(BagRepository repo) : _cartRepository = repo;
  addToCart(BagModel model) async {
    await _localCartSerivce.storeCart(model.toJson());
    items.add(model);
    // _cartRepository.addItem(model);
    notifyListeners();
  }

  fetchAllCart() async {
    final _localItems = _localCartSerivce.getAllCartItems();
    items = _localItems.map((item) => BagModel.fromJson(item)).toList();
    await Future.delayed(Duration(seconds: 2));

    // items = await _cartRepository.fetchAllItems();
    notifyListeners();
  }

  deleteCart(String productID) {}

  deleteAllCarts() {
    _localCartSerivce.clearCart();
    items.clear();
    notifyListeners();
  }
}
