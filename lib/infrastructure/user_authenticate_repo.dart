import 'package:google_sign_in/google_sign_in.dart';
import 'package:style_on_app/domain/repository/auth/auth_repo.dart';
import 'package:style_on_app/domain/repository/firebase_repo.dart';
import 'package:style_on_app/domain/services/auth_service.dart';

import 'package:style_on_app/domain/shared/exception_codes.dart';
import 'package:style_on_app/domain/shared/exceptions.dart';
import 'package:style_on_app/exports/pkgs_exports.dart';
import 'package:style_on_app/exports/ui_exports.dart';

class UserAuthenticateRepoImpl extends AuthenticaitonRepo
    implements ThirdPartyAuthRepo<ThirdPartAuthType> {
  final BaseRepository _repository;
  UserAuthenticateRepoImpl(this._repository) : super(_repository);

  @override
  Future<UserCredential> createUser(String email, String password) async {
    try {
      final user = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _repository.add(user);
      return user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case alreadyRegisteredCode:
          throw AuthException(userRegisteredMsg);
        case invalidEmailCode:
          throw AuthException(userNotExistsMsg);
        case permissionDeniedCode:
          throw AuthException(somethingWentWrongMsg);
        case weakPasswordCode:
          throw AuthException(passworkWeakMsg);
      }
    } catch (e) {
      debugPrint("SignUp -> $e");
      throw UnkownException(somethingWentWrongMsg);
    }
    throw UnkownException(somethingWentWrongMsg);
  }

  @override
  Future<UserCredential> signIn(String email, password) async {
    try {
      final user = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case wrongPasswordCode:
          throw AuthException(invalidPasswordMsg);
        case userDisabledCode:
          throw AuthException(disabledUserMsg);
        case userNotFoundCode:
          throw AuthException(userNotExistsMsg);
      }
    } catch (e) {
      debugPrint("SignIn -> $e");
      throw UnkownException(somethingWentWrongMsg);
    }
    throw UnkownException(somethingWentWrongMsg);
  }

  @override
  signInWith(type) async {
    switch (type) {
      case ThirdPartAuthType.google:
        var user = await GoogleSignIn().signIn();
        
        
        break;
      default:
    }
  }

  @override
  void signOut() async {
    await auth.signOut();
  }

  @override
  findUser(String id) {}
  @override
  authenticationState() {}

  @override
  deleteAccount() async {
    try {
      final uid = auth.currentUser?.uid;
      debugPrint("Current User $uid");
      await auth.currentUser?.delete();
      _repository.delete(uid!);
      return true;
    } on FirebaseAuthException catch (e) {
      if (requireLoginCode == e.code) AuthException(requireLoginMsg);
    } catch (e) {
      debugPrint("deleteAccount -> $e");
      throw UnkownException(somethingWentWrongMsg);
    }
    throw UnkownException(somethingWentWrongMsg);
  }
}
