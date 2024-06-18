abstract class UserLayoutStates {}

class UserLayoutInitialState extends UserLayoutStates {}

class UserBottomNavState extends UserLayoutStates {}

class GetUserDataLoadingState extends UserLayoutStates {}

class GetAcceptRequestDataLoadingState extends UserLayoutStates {}

class GetAcceptRequestSuccessState extends UserLayoutStates {}

class GetUserDataSuccessState extends UserLayoutStates {}

class GanderChangeStates extends UserLayoutStates {}

class UpdateProblemLoadingState extends UserLayoutStates {}

class UpdateProfileLoadingState extends UserLayoutStates {}

class UpdateProfileSuccessState extends UserLayoutStates {}

class UpdatePhotoSuccessState extends UserLayoutStates {}

class UpdateRemovePhotoSuccessState extends UserLayoutStates {}

class UpdateDescriptionSuccessState extends UserLayoutStates {}

class UpdateProfilePhotoSuccessState extends UserLayoutStates {}

class UpdateProfilePhotoErrorState extends UserLayoutStates {
  String error;

  UpdateProfilePhotoErrorState(this.error);
}

class GetUserDataErrorState extends UserLayoutStates {
  String error;

  GetUserDataErrorState(this.error);
}

class GetAcceptRequesErrorState extends UserLayoutStates {
  String error;

  GetAcceptRequesErrorState(this.error);
}

class UpdatePhotoErrorState extends UserLayoutStates {
  String error;

  UpdatePhotoErrorState(this.error);
}

