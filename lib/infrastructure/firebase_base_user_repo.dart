import 'package:firebase_auth/firebase_auth.dart';
import 'package:style_on_app/domain/repository/firebase_repo.dart';
import 'package:style_on_app/domain/shared/firebase_collections.dart';
import 'package:style_on_app/exports/pkgs_exports.dart';

class FirebaseBaseUserRepoImpl extends BaseRepository<UserCredential> {
  @override
  add(_data) async {
    final user = _data;
    final userData = {
      "uid": user.user?.uid,
      "username": user.additionalUserInfo?.username,
      "display_name": user.user?.displayName,
      "email": user.user?.email,
      "emailVerified": user.user?.emailVerified,
      "profile_pic": null,
    };
    await FirebaseFirestore.instance
        .collection("users")
        .doc(user.user!.uid)
        .set(userData);
  }

  @override
  Future<bool> delete(String id) async {
    await FirebaseFirestore.instance.collection("users").doc(id).delete();
    return true;
  }

  @override
  find() {
    // TODO: implement find
    throw UnimplementedError();
  }

  @override
  update() {
    // TODO: implement update
    throw UnimplementedError();
  }
}
