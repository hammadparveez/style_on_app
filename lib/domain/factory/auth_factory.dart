import 'package:style_on_app/domain/repository/auth/auth_repo.dart';
import 'package:style_on_app/infrastructure/user_authenticate_repo.dart';
import 'package:style_on_app/infrastructure/firebase_base_user_repo.dart';

enum AuthenticationCreationType {
  manualAccount,
}

class AuthenticationFactory {
  static AuthenticaitonRepo create(AuthenticationCreationType authType) {
    switch (authType) {
      case AuthenticationCreationType.manualAccount:
        return UserAuthenticateRepoImpl(FirebaseBaseUserRepoImpl());
    }
  }
}
