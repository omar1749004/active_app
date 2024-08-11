class ClientTrainingModel {
  int groupId;
  int trainingId;
  String trainingName;
  String trainingNameAr;
  String trainingDesc;
  String trainingDescAr;
  String ?trainingImage;

  String? sets;
  String? time;

  ClientTrainingModel({
    required this.groupId,
    required this.trainingId,
    required this.trainingName,
    required this.trainingNameAr,
    required this.trainingDesc,
    required this.trainingDescAr,
    required this.trainingImage,
     this.sets,
     this.time,
  });

  factory ClientTrainingModel.fromJson(Map<String, dynamic> json) {
    return ClientTrainingModel(
      groupId: json['groupid'],
      trainingId: json['training_id'],
      trainingName: json['training_name'],
      trainingNameAr: json['training_name_ar'],
      trainingDesc: json['training_desc'],
      trainingDescAr: json['training_desc_ar'],
      trainingImage: json['training_image'],
      sets: json['sets'],
      time: json['time'],
    );
  }
}