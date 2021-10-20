import 'package:firebase_auth/firebase_auth.dart';
import 'package:style_on_app/domain/repository/firebase_repo.dart';

abstract class AuthenticaitonRepo extends FirebaseAuthRpo {
  AuthenticaitonRepo(BaseRepository data);

  Future<UserCredential> createUser(String email, String password);

  Future<UserCredential> signIn(String email, password);

  void signOut();

  findUser(String id);

  authenticationState();

  Future<bool> deleteAccount();
}

abstract class ThirdPartyAuthRepo<T> {
  signInWith(T type);
}
