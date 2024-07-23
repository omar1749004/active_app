class BranchModel {
  int branchId;
  String branchNameAr;
  String branchNameEn;
  String branchOpenDayAr;
  String branchOpenDayEn;
  String branchOpenTime;
  String branchDetailsAr;
  String branchDetailsEn;

  BranchModel({
    required this.branchId,
    required this.branchNameAr,
    required this.branchNameEn,
    required this.branchOpenDayAr,
    required this.branchOpenDayEn,
    required this.branchOpenTime,
    required this.branchDetailsAr,
    required this.branchDetailsEn,
  });

  factory BranchModel.fromJson(Map<String, dynamic> json) {
    return BranchModel(
      branchId: json['branch_id'],
      branchNameAr: json['branch_name_ar'],
      branchNameEn: json['branch_name_en'],
      branchOpenDayAr: json['branch_open_day_ar'],
      branchOpenDayEn: json['branch_open_day_en'],
      branchOpenTime: json['branch_open_time'],
      branchDetailsAr: json['branch_details_ar'],
      branchDetailsEn: json['branch_details_en'],
    );
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'branch_id': branchId,
  //     'branch_name_ar': branchNameAr,
  //     'branch_name_en': branchNameEn,
  //     'branch_open_day_ar': branchOpenDayAr,
  //     'branch_open_day_en': branchOpenDayEn,
  //     'branch_open_time': branchOpenTime,
  //     'branch_details_ar': branchDetailsAr,
  //     'branch_details_en': branchDetailsEn,
  //   };
  // }
}

class BranchImageModel {
  int branchImageId;
  int branchId;
  String branchImage;

  BranchImageModel({
    required this.branchImageId,
    required this.branchId,
    required this.branchImage,
  });

  factory BranchImageModel.fromJson(Map<String, dynamic> json) {
    return BranchImageModel(
      branchImageId: json['branch_image_id'],
      branchId: json['branch_id'],
      branchImage: json['branch_image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'branch_image_id': branchImageId,
      'branch_id': branchId,
      'branch_image': branchImage,
    };
  }
}