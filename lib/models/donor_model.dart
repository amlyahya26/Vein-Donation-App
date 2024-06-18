class DonorModel{
  String? profileImage;
  String? firstName;
  String? lastName;
  String? emailAddress;
  String? gender;
  String? address;
  String? nationality;
  String? jobDescription;
  String? nationalIdResidencyId;
  String? uId;
  String? isActive;

  DonorModel({
    required this.profileImage,
    required this.firstName,
    required this.lastName,
    required this.emailAddress,
    required this.gender,
    required this.address,
    required this.nationality,
    required this.jobDescription,
    required this.nationalIdResidencyId,
    required this.uId,
    required this.isActive,
  });

  DonorModel.formJson(Map<String, dynamic>? json) {
    if (json == null) {
      return;
    }
    profileImage = json['profile_image'];

    firstName = json['first_name'];
    lastName = json['last_name'];
    emailAddress = json['email_address'];
    gender = json['gender'];
    address = json['address'];
    nationality = json['nationality'];
    jobDescription = json['job_description'];
    nationalIdResidencyId = json['national_id_residency_iD'];
    uId = json['uId'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    return {
      'profile_image': profileImage,
      'first_name': firstName,
      'last_name': lastName,
      'email_address': emailAddress,
      'gender': gender,
      'address': address,
      'nationality': nationality,
      'job_description': jobDescription,
      'national_id_residency_iD': nationalIdResidencyId,
      'uId': uId,
      'is_active': isActive,
    };
  }
}