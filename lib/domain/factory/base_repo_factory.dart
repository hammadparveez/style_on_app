
import 'package:style_on_app/domain/repository/firebase_repo.dart';

import 'package:style_on_app/infrastructure/firebase_base_user_repo.dart';

enum BaseRepoCreationType {
  authRepo,
}

class AuthenticationFactory {
  BaseRepository create(BaseRepoCreationType type) {
    switch (type) {
      case BaseRepoCreationType.authRepo:
        return FirebaseBaseUserRepoImpl();
    }
  }
}
