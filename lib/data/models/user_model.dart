class UserModel {
  int? usersId;
  String? usersName;
  String? usersPhone;
  String? usersAddress;
  String? usersNote;
  String? usersImage;
  String? usersDate;
  int? usersGender;
  String? usersCreate;
  int? usersCaptiantId;
  int? usersType;
  int? usersBranch;
  int? barcodeId;
  int? barcodeUserId;
  int? barcodeNumber;

  UserModel({
    this.usersId,
    this.usersName,
    this.usersPhone,
    this.usersAddress,
    this.usersNote,
    this.usersImage,
    this.usersDate,
    this.usersGender,
    this.usersCreate,
    this.usersCaptiantId,
    this.usersType,
    this.usersBranch,
    this.barcodeId,
    this.barcodeUserId,
    this.barcodeNumber,
  });

  // Factory method to create an instance from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      usersId: json['users_id'],
      usersName: json['users_name'],
      usersPhone: json['users_phone'],
      usersAddress: json['users_adress'],
      usersNote: json['users_note'],
      usersImage: json['users_image'],
      usersDate: json['users_date'],
      usersGender: json['users_gender'],
      usersCreate: json['users_create'],
      usersCaptiantId: json['users_captiantid'],
      usersType: json['users_type'],
      usersBranch: json['users_branch'],
      barcodeId: json['barcode_id'],
      barcodeUserId: json['barcode_user_id'],
      barcodeNumber: json['barcode_number'],
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'users_id': usersId,
      'users_name': usersName,
      'users_phone': usersPhone,
      'users_adress': usersAddress,
      'users_note': usersNote,
      'users_image': usersImage,
      'users_date': usersDate,
      'users_gender': usersGender,
      'users_create': usersCreate,
      'users_captiantid': usersCaptiantId,
      'users_type': usersType,
      'users_branch': usersBranch,
      'barcode_id': barcodeId,
      'barcode_user_id': barcodeUserId,
      'barcode_number': barcodeNumber,
    };
  }
}