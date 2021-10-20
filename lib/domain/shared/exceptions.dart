//Exceptions Messages
const userRegisteredMsg = "User is already registered";
const userNotExistsMsg = "User does not exists";
const passworkWeakMsg = "Please enter a strong password";
const invalidPasswordMsg = "Please enter a correct Password";
const somethingWentWrongMsg = "Something went wrong";
const disabledUserMsg = "Your access is restricted";
const requireLoginMsg = "You have to Sign In in order to delete an account";

class BaseException implements Exception {
  String msg;

  BaseException(this.msg);
}

class AuthException extends BaseException {
  AuthException(String msg) : super(msg);
}

class NetworkException extends BaseException {
  NetworkException(String msg) : super(msg);
}

class UnkownException extends BaseException {
  UnkownException(String msg) : super(msg);
}
