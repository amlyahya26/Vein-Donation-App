class UserModel {
  String? profileImage;
  List<String> documentsImage = [];
  String? firstName;
  String? lastName;
  String? emailAddress;
  String? gender;
  String? address;
  String? nationality;
  String? jobDescription;
  String? nationalIdResidencyId;
  String? descriptionOfProblem;
  String? neededThingsToBeDonated;
  String? uId;
  String? isActive;

  UserModel({
    required this.profileImage,
    required this.documentsImage,
    required this.firstName,
    required this.lastName,
    required this.emailAddress,
    required this.gender,
    required this.address,
    required this.nationality,
    required this.jobDescription,
    required this.nationalIdResidencyId,
    required this.descriptionOfProblem,
    required this.neededThingsToBeDonated,
    required this.uId,
    required this.isActive,
  });

  UserModel.formJson(Map<String, dynamic>? json) {
    if (json == null) {
      return;
    }
    profileImage = json['profile_image'];
    json['documents_image'].forEach((element) {
      documentsImage.add(element);
    });
    firstName = json['first_name'];
    lastName = json['last_name'];
    emailAddress = json['email_address'];
    gender = json['gender'];
    address = json['address'];
    nationality = json['nationality'];
    jobDescription = json['job_description'];
    nationalIdResidencyId = json['national_id_residency_iD'];
    descriptionOfProblem = json['description_of_problem'];
    neededThingsToBeDonated = json['needed_things_to_be_donated'];
    uId = json['uId'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    return {
      'profile_image': profileImage,
      'documents_image': documentsImage,
      'first_name': firstName,
      'last_name': lastName,
      'email_address': emailAddress,
      'gender': gender,
      'address': address,
      'nationality': nationality,
      'job_description': jobDescription,
      'national_id_residency_iD': nationalIdResidencyId,
      'description_of_problem': descriptionOfProblem,
      'needed_things_to_be_donated': neededThingsToBeDonated,
      'uId': uId,
      'is_active': isActive,
    };
  }
}
