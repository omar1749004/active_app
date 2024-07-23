class PhysicalInfo {
  int physicalInfoId;
  int physicalInfoUserId;
  int physicalInfoLength;
  int physicalInfoWeight;
  int physicalInfoAge;
  double physicalInfoMusclePercentage;
  double physicalInfoFatPercentage;

  PhysicalInfo({
    required this.physicalInfoId,
    required this.physicalInfoUserId,
    required this.physicalInfoLength,
    required this.physicalInfoWeight,
    required this.physicalInfoAge,
    required this.physicalInfoMusclePercentage,
    required this.physicalInfoFatPercentage,
  });

  factory PhysicalInfo.fromJson(Map<String, dynamic> json) {
    return PhysicalInfo(
      physicalInfoId: json['physical_Info_id'],
      physicalInfoUserId: json['physical_Info_userid'],
      physicalInfoLength: json['physical_Info_length'],
      physicalInfoWeight: json['physical_Info_weight'],
      physicalInfoAge: json['physical_Info_age'],
      physicalInfoMusclePercentage: json['physical_Info_musclepe'],
      physicalInfoFatPercentage: json['physical_Info_fatpe'],
    );
  }

}