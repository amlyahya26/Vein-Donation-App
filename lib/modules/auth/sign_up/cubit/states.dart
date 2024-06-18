abstract class SignUpStates {}

class SignUpInitialState extends SignUpStates {}

class PasswordToggleStates extends SignUpStates {}

class GanderChangeStates extends SignUpStates {}

class UploadPhotoSuccessState extends SignUpStates {}

class CreateAccountSuccessState extends SignUpStates {}

class UploadInfoAccountSuccessState extends SignUpStates {}

class UploadPhotosSuccessState extends SignUpStates {}


class UploadProfilePhotoSuccessState extends SignUpStates {}

class RemovePhotoSuccessState extends SignUpStates {}

class SignUpLoadingState extends SignUpStates {}

class UploadPhotoErrorState extends SignUpStates {
  String error;

  UploadPhotoErrorState(this.error);
}

class UploadInfoAccountErrorState extends SignUpStates {
  String error;

  UploadInfoAccountErrorState(this.error);
}

class CreateAccountErrorState extends SignUpStates {
  String error;

  CreateAccountErrorState(this.error);
}

class UploadProfilePhotoErrorState extends SignUpStates {
  String error;

  UploadProfilePhotoErrorState(this.error);
}


