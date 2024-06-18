abstract class AuthStates {}

class AuthInitialState extends AuthStates {}

class PasswordToggleStates extends AuthStates {}

class LoginLoadingState extends AuthStates {}

class DonorLoginLoadingState extends AuthStates {}

class LoginSuccessState extends AuthStates {}

class LoginErrorState extends AuthStates {
  String error;

  LoginErrorState(this.error);
}

