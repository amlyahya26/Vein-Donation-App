class AcceptRequestModel {
  String? userId;
  String? descriptionOfProblem;
  String? donorId;
  String? requestId;
  String? neededThingsToBeDonated;
  List<String>? documentsImage;

  AcceptRequestModel(
      {this.userId,
        this.descriptionOfProblem,
        this.donorId,
        this.requestId,
        this.neededThingsToBeDonated,
        this.documentsImage});

  AcceptRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    descriptionOfProblem = json['description_of_problem'];
    donorId = json['donor_id'];
    requestId = json['request_id'];
    neededThingsToBeDonated = json['needed_things_to_be_donated'];
    documentsImage = json['documents_image'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['description_of_problem'] = this.descriptionOfProblem;
    data['donor_id'] = this.donorId;
    data['request_id'] = this.requestId;
    data['needed_things_to_be_donated'] = this.neededThingsToBeDonated;
    data['documents_image'] = this.documentsImage;
    return data;
  }
}
