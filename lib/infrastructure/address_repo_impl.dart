import 'package:style_on_app/domain/model/address/address_model.dart';

import 'package:style_on_app/domain/repository/address/address_repo.dart';
import 'package:style_on_app/domain/repository/firebase_repo.dart';
import 'package:style_on_app/domain/shared/firebase_collections.dart';
import 'package:style_on_app/exports/pkgs_exports.dart';

class AddressRepositoryImpl extends AddressRepository with FirebaseRepo {
  DocumentReference<Map<String, dynamic>>? _documentReference;
  static final _instance = AddressRepositoryImpl._();

  AddressRepositoryImpl._() {
    String? uid = FirebaseAuth.instance.currentUser?.uid;
    assert(uid != null);
    _documentReference = firestore.collection(kCollectionUser).doc(uid);
  }

  factory AddressRepositoryImpl() => _instance;

  @override
  getAddress(AddressModel model) {
    // TODO: implement getAddress
    throw UnimplementedError();
  }

  @override
  resetAddress(AddressModel model) {
    // TODO: implement resetAddress
    throw UnimplementedError();
  }

  @override
  setAddress(AddressModel model) async {
    final updatedModel =
        model.copyWith(createdAt: FieldValue.serverTimestamp()).toMap();

    await _documentReference!.update({
      'shipping_address': updatedModel,
      'permanent_address': model.isPermanent ? updatedModel : null,
    });
  }

  @override
  updateAddress(AddressModel model) {
    // TODO: implement updateAddress
    throw UnimplementedError();
  }
}
