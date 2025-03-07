abstract class AuthStates {}

class AuthInitial extends AuthStates {}

class AuthFailure extends AuthStates {
  final String msg;
  AuthFailure(this.msg);
}

class AuthSuccess extends AuthStates {
  final String msg;
  AuthSuccess(this.msg);
}
