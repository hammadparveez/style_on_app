import 'package:firebase_storage/firebase_storage.dart';
import 'package:style_on_app/exports/pkgs_exports.dart';

abstract class FirebaseRepo {
  final firestore = FirebaseFirestore.instance;
  final firebaseStorage = FirebaseStorage.instance;
}
