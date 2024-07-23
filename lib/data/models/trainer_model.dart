class TrainerModel {
  final String? image;
  final String? name;
  int? usersId;

  TrainerModel({this.image, this.name, this.usersId});
  factory TrainerModel.fromJson(Map<String, dynamic> json) {
    return TrainerModel(
      name: json['users_name'],
      usersId: json['users_id'],
      image: json['users_image'],
    );
  }
}
