class ClientTraining {
  int groupId;
  String trainingDayName;
  String trainingDayNameAr;
  int trainingId;
  String trainingName;
  String trainingNameAr;
  String trainingDesc;
  String trainingDescAr;
  String trainingImage;
  int trainingWeekId;
  String trainingWeekName;
  int trainingWeekLevel;
  String? sets;
  String? time;

  ClientTraining({
    required this.groupId,
    required this.trainingDayName,
    required this.trainingDayNameAr,
    required this.trainingId,
    required this.trainingName,
    required this.trainingNameAr,
    required this.trainingDesc,
    required this.trainingDescAr,
    required this.trainingImage,
    required this.trainingWeekId,
    required this.trainingWeekName,
    required this.trainingWeekLevel,
     this.sets,
     this.time,
  });

  factory ClientTraining.fromJson(Map<String, dynamic> json) {
    return ClientTraining(
      groupId: json['groupid'],
      trainingDayName: json['trainingday_name'],
      trainingDayNameAr: json['trainingday_name_ar'],
      trainingId: json['training_id'],
      trainingName: json['training_name'],
      trainingNameAr: json['training_name_ar'],
      trainingDesc: json['training_desc'],
      trainingDescAr: json['training_desc_ar'],
      trainingImage: json['training_image'],
      trainingWeekId: json['trainingWeek_id'],
      trainingWeekName: json['trainingWeek_name'],
      trainingWeekLevel: json['trainingweek_level'],
      sets: json['sets'],
      time: json['time'],
    );
  }
}