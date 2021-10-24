import 'dart:developer';

import 'package:style_on_app/domain/model/bag_model.dart';
import 'package:style_on_app/domain/repository/cart_service/cart_repository.dart';
import 'package:style_on_app/domain/services/local_service.dart';
import 'package:style_on_app/domain/services/riverpod/pods.dart';
import 'package:style_on_app/exports/pkgs_exports.dart';
import 'package:style_on_app/exports/ui_exports.dart';
import 'package:style_on_app/exports/utils_export.dart';

enum UpdateBagType {
  increment,
  decrement,
}

class CartService extends ChangeNotifier {
  CartService(BagRepository repo) : _cartRepository = repo;

  final BagRepository _cartRepository;
  final LocalCartSerivce _localCartSerivce = LocalCartSerivce();
  double _totalAmount = 0;

  List<BagModel> items = [];

  List<dynamic> _localItems = [];
  double get totalAmount => _totalAmount;

  addToCart(BagModel model) async {
    await _localCartSerivce.storeCart(model.toJson());
    items.add(model);
    // _cartRepository.addItem(model);
    notifyListeners();
  }

  fetchAllCart() async {
    _totalAmount = 0;

    _localItems = _localCartSerivce.getAllCartItems();
    items = _localItems.map((item) {
      final model = BagModel.fromJson(item);
      _totalAmount += (model.productPrice * model.qty);
      return model;
    }).toList();
    await Future.delayed(Duration(seconds: 1));
    // items = await _cartRepository.fetchAllItems();
    notifyListeners();
    return items;
  }

  updateCart(int index, UpdateBagType type) {
    BagModel _model = items[index];
    //Resting current Index Prices to 0;
    _totalAmount -= (_model.productPrice * _model.qty);
    if (type == UpdateBagType.increment) {
      _model = _model.copyWith(qty: ++_model.qty);
    } else if (type == UpdateBagType.decrement) {
      _model = _model.copyWith(qty: --_model.qty);
    }
    _totalAmount += (_model.productPrice * _model.qty);
    Hive.box(cartBoxName).putAt(index, _model.toJson());

    notifyListeners();
  }

  deleteCart(int index) {
    _localCartSerivce.deleteItem(index);
    var model = items.removeAt(index);
    _totalAmount -= (model.productPrice * model.qty);
    notifyListeners();
  }

  deleteAllCarts() {
    _localCartSerivce.clearCart();
    items.clear();
    notifyListeners();
  }
}
