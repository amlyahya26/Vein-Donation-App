abstract class AdminLayoutStates {}

class AdminLayoutInitialState extends AdminLayoutStates {}

class GetAllUsersSuccessState extends AdminLayoutStates {}

class GetAcceptRequestDataLoadingState extends AdminLayoutStates {}
class GetAcceptRequestDataSuccessState extends AdminLayoutStates {}

class SignOutSuccessState extends AdminLayoutStates {}

class GetAllUsersErrorState extends AdminLayoutStates {
  String error;

  GetAllUsersErrorState(this.error);
}

class GetAcceptRequesErrorState extends AdminLayoutStates {
  String error;

  GetAcceptRequesErrorState(this.error);
}
