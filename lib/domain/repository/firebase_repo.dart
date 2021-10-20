import 'package:firebase_storage/firebase_storage.dart';
import 'package:style_on_app/exports/pkgs_exports.dart';

abstract class FirebaseRepo<T> {
  final firestore = FirebaseFirestore.instance;
  final firebaseStorage = FirebaseStorage.instance;
}

abstract class FirebaseAuthRpo {
  final auth = FirebaseAuth.instance;
}

abstract class BaseRepository<T> {
  
 Future<T?> add(T _data);
  find();
  Future<bool> delete(String id);
  update();
}
