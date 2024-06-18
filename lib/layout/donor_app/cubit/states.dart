abstract class DonorLayoutStates {}

class DonorLayoutInitialState extends DonorLayoutStates {}

class DonorBottomNavState extends DonorLayoutStates {}

class GetDonorDataLoadingState extends DonorLayoutStates {}

class UploadProfilePhotoSuccessState extends DonorLayoutStates {}

class GanderChangeStates extends DonorLayoutStates {}

class GetAllUsersSuccessState extends DonorLayoutStates {}

class GetAllRequestsSuccessState extends DonorLayoutStates {}

class AcceptRequestSuccessState extends DonorLayoutStates {}

class GetDonorDataSuccessState extends DonorLayoutStates {}

class UpdateProfileLoadingState extends DonorLayoutStates {}

class UpdateProfileSuccessState extends DonorLayoutStates {}

class SignOutSuccessState extends DonorLayoutStates {}

class AcceptLoadingState extends DonorLayoutStates {}

class GetDonorDataErrorState extends DonorLayoutStates {
  String error;

  GetDonorDataErrorState(this.error);
}

class AcceptRequestErrorState extends DonorLayoutStates {
  String error;

  AcceptRequestErrorState(this.error);
}

class GetAllRequestsErrorState extends DonorLayoutStates {
  String error;

  GetAllRequestsErrorState(this.error);
}

class GetAllUsersErrorState extends DonorLayoutStates {
  String error;

  GetAllUsersErrorState(this.error);
}

class UploadProfilePhotoErrorState extends DonorLayoutStates {
  String error;

  UploadProfilePhotoErrorState(this.error);
}

