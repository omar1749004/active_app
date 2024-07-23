class Nutrition {
  int nutritionId;
  int nutritionUserId;
  String nutritionDesc;
  String nutritionImage;
  int nutritionCalory;
  String nutritionCreatedAt;

  Nutrition({
    required this.nutritionId,
    required this.nutritionUserId,
    required this.nutritionDesc,
    required this.nutritionImage,
    required this.nutritionCalory,
    required this.nutritionCreatedAt,
  });

  factory Nutrition.fromJson(Map<String, dynamic> json) {
    return Nutrition(
      nutritionId: json['nutrition_id'],
      nutritionUserId: json['nutrition_userId'],
      nutritionDesc: json['nutrition_desc'],
      nutritionImage: json['nutrition_image'],
      nutritionCalory: json['nutrition_calory'],
      nutritionCreatedAt: json['nutrition_created_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nutrition_id': nutritionId,
      'nutrition_userId': nutritionUserId,
      'nutrition_desc': nutritionDesc,
      'nutrition_image': nutritionImage,
      'nutrition_calory': nutritionCalory,
      'nutrition_created_at': nutritionCreatedAt,
    };
  }
}