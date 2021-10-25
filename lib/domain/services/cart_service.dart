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

enum LoadingStatus { error, loading, success }

class BagService extends ChangeNotifier {
  BagService(BagRepository repo) : _cartRepository = repo;

  final BagRepository _cartRepository;
  var _status = LoadingStatus.loading;
  final LocalCartSerivce _localCartSerivce = LocalCartSerivce();
  double _totalAmount = 0;

  List<BagModel> _items = [];
  List<BagModel> get items => _items;

  // List<dynamic> _localItems = [];
  double get totalAmount => _totalAmount;
  LoadingStatus get status => _status;
  addToCart(BagModel model) async {
    //await _localCartSerivce.storeCart(model.toJson());
    _status = LoadingStatus.loading;
    notifyListeners();

    try {
      await _cartRepository.addItem(model);
      _items.add(model);
      _status = LoadingStatus.success;
    } catch (e) {
      _status = LoadingStatus.success;
      log("Exception Occured $e");
    }
    notifyListeners();
  }

  fetchAllCart() async {
    _totalAmount = 0;
    _status = LoadingStatus.loading;

    notifyListeners();

    //_localItems = _localCartSerivce.getAllCartItems();
    // items = _localItems.map((item) {
    //   final model = BagModel.fromJson(item);
    //   _totalAmount += (model.productPrice * model.qty);
    //   return model;
    // }).toList();

    try {
      _items = await _cartRepository.fetchAllItems();
      for (var model in _items) {
        _totalAmount += model.productPrice * model.qty;
      }
      _status = LoadingStatus.success;
    } catch (e) {
      _status = LoadingStatus.error;
    }

    notifyListeners();
    return _items;
  }

  updateCart(int index, UpdateBagType type) async {
    BagModel _model = _items[index];
    //Resting current Index Prices to 0;
    _totalAmount -= (_model.productPrice * _model.qty);
    if (type == UpdateBagType.increment) {
      _model = _model.copyWith(qty: ++_model.qty);
    } else if (type == UpdateBagType.decrement) {
      if (_model.qty > 1) {
        _model = _model.copyWith(qty: --_model.qty);
      } else
        return;
    }
    _totalAmount += (_model.productPrice * _model.qty);
    //await _localCartSerivce.updateItem(index, _model);
    _items[index] = _model;
    notifyListeners();
    await _cartRepository.updateItem(_model);
    notifyListeners();
  }

  deleteCart(int index) {
    //_localCartSerivce.deleteItem(index);

    var model = _items.removeAt(index);
    _totalAmount -= (model.productPrice * model.qty);
    _cartRepository.deleteItem(model.cartId);
    notifyListeners();
  }

  deleteAllCarts() async {
    //_localCartSerivce.clearCart();

    await _cartRepository.deleteAll();
    _items.clear();
    _totalAmount = 0;
    notifyListeners();
  }
}
