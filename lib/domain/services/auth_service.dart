import 'dart:developer';

import 'package:style_on_app/domain/repository/auth/auth_repo.dart';

import 'package:style_on_app/domain/services/riverpod/pods.dart';
import 'package:style_on_app/domain/shared/exceptions.dart';
import 'package:style_on_app/exports/pkgs_exports.dart';
import 'package:style_on_app/exports/ui_exports.dart';

  enum ThirdPartAuthType {
    google, facebook, github
  }


class AuthService extends ChangeNotifier {
  final AuthenticaitonRepo _authRepo;

  AuthService(
    this._authRepo,
  );

  createAccount(String email, String password) async {
    try {
      final user = await _authRepo.createUser(email, password);
      localService.setSessionID(user.user!.uid);
    } on BaseException catch (e) {
      debugPrint("Error ${e.msg}");
    }
  }

  signIn(String email, String password) async {
    try {
      final user = await _authRepo.signIn(email, password);

      localService.setSessionID(user.user!.uid);
      debugPrint("User ${user}");
    } on BaseException catch (e) {
      debugPrint("Error ${e.msg}");
    }
  }

  signInBy(ThirdPartAuthType type) {
    switch (type) {
      case ThirdPartAuthType.google:
        
        break;
      default:
    }

  }

  attachAuthStateListener({Function(User)? onLogIn, VoidCallback? onLogOut}) {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null && onLogIn != null) {
        log("Authentication State -> $user");
        onLogIn(user);
      }
      if (onLogOut != null) {
        log("Log Out Authentication State -> $user");
        onLogOut();
      }
    });
  }

  signOut() {
    _authRepo.signOut();
    localService.deleteSessionID();
  }

  deleteAccount() {
    _authRepo.deleteAccount();
  }
}
