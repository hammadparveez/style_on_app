import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:style_on_app/domain/model/bag_model.dart';
import 'package:style_on_app/domain/model/product/product_model.dart';
import 'package:style_on_app/domain/repository/cart_service/cart_repository.dart';
import 'package:style_on_app/domain/repository/firebase_repo.dart';
import 'package:style_on_app/domain/shared/exceptions.dart';
import 'package:style_on_app/domain/shared/firebase_collections.dart';
import 'package:style_on_app/exports/pkgs_exports.dart';

class CartRepositoryImpl extends BagRepository
    with FirebaseRepo, FirebaseAuthRpo {
  User? user;
  CartRepositoryImpl() {
    user = auth.currentUser;
  }

  CollectionReference<Map<String,dynamic>> _cartCollectionRefrence() {
       return firestore
        .collection(kCollectionUser)
        .doc(user!.uid)
        .collection(kCollectionCart);
  }

  @override
  addItem(BagModel model) async {
    if (user != null) {
      await _cartCollectionRefrence()
          .add(model.toMap());
    } else {
      throw AuthException(userIsNotLoggedInMSg);
    }
  }



  @override
  Future<List<BagModel>>  fetchAllItems() async {
       final qs = await _cartCollectionRefrence().get();
        return qs.docs.map((item) => BagModel.fromMap(item.data()),).toList();
  }

  @override
  deleteAll() {
    // TODO: implement deleteAll
    throw UnimplementedError();
  }

  @override
  deleteItem(String productID) {
    // TODO: implement deleteItem
    throw UnimplementedError();
  }

  @override
  updateItem(String productID) {
    // TODO: implement updateItem
    throw UnimplementedError();
  }
}
