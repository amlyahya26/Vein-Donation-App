class RequestModel{
  late String donorID;
  late String userID;
  late String requestID;
  late String neededThingsToBeDonated;
  late String descriptionOfProblem;
  List<String> documentsImage = [];


  RequestModel.formJson(Map<String, dynamic>? json) {
    if (json == null) {
      return;
    }
    donorID = json['donor_id'];
    userID = json['user_id'];
    requestID = json['request_id'];
    neededThingsToBeDonated = json['needed_things_to_be_donated'];
    descriptionOfProblem = json['description_of_problem'];
    json['documents_image'].forEach((element) {
      documentsImage.add(element);
    });
  }

  Map<String, dynamic> toJson() {
    return {
      'donor_id': donorID,
      'user_id': userID,
      'request_id': requestID,
      'needed_things_to_be_donated': neededThingsToBeDonated,
      'description_of_problem': descriptionOfProblem,
      'documents_image': documentsImage,
    };
  }
}