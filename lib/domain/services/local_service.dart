import 'dart:developer';

import 'package:style_on_app/exports/pkgs_exports.dart';
import 'package:style_on_app/exports/utils_export.dart';

class LocalService {
  static final LocalService _instance = LocalService._();

  LocalService._();
  factory LocalService() => _instance;

  final _box = Hive.box(appBoxName);

  void setSessionID(String id) {
    _box.put(sessionIDKey, id);
  }

  String? getSessionID() {
    return _box.get(sessionIDKey);
  }

  deleteSessionID() {
    _box.delete(sessionIDKey);
  }

  bool hasOnBoardSeen() {
    final hasSeen = _box.get(onBoardKey) ?? false;
    return hasSeen;
  }

  void setOnBoardSeen() {
    _box.put(onBoardKey, true);
  }
}

class LocalCartSerivce {
  final _box = Hive.box(cartBoxName);
  storeCart(String json) async {
    await _box.add(json);
  }

  List<dynamic> getAllCartItems() {
    return _box.values.toList();
  }

  deleteItem(int key) {
    final item = _box.getAt(key);
    if (item != null) {
      _box.deleteAt(key);
    }
  }

  clearCart() {
    _box.clear();
  }
}
