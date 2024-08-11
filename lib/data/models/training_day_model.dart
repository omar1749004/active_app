class TrainingDayModel {
  int trainingdayId;
  int trainingdayTrainingweekid;
  String trainingdayName;
  String trainingdayNameAr;
  String ?trainingdayImage;

  TrainingDayModel({
    required this.trainingdayId,
    required this.trainingdayTrainingweekid,
    required this.trainingdayName,
    required this.trainingdayNameAr,
     this.trainingdayImage,
  });

  // Factory method to create an instance from JSON
  factory TrainingDayModel.fromJson(Map<String, dynamic> json) {
    return TrainingDayModel(
      trainingdayId: json['trainingday_id'],
      trainingdayTrainingweekid: json['trainingday_trainingweekid'],
      trainingdayName: json['trainingday_name'],
      trainingdayNameAr: json['trainingday_name_ar'],
      trainingdayImage: json['trainingday_image'],
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'trainingday_id': trainingdayId,
      'trainingday_trainingweekid': trainingdayTrainingweekid,
      'trainingday_name': trainingdayName,
      'trainingday_name_ar': trainingdayNameAr,
      'trainingday_image': trainingdayImage,
    };
  }
}
