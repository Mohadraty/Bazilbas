class UserModel {
  String? userId;
  String? userFullName;
  String? userEmail;
  String? userPhone;
  String? userAddress;

  UserModel(
      {this.userId,
      this.userFullName,
      this.userEmail,
      this.userPhone,
      this.userAddress});

  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userFullName = json['user_fullName'];
    userEmail = json['user_email'];
    userPhone = json['user_phone'];
    userAddress = json['user_address'];
  }
}

class UserApiModel {
  UserModel? userInfo;
  bool? success;
  String? message;

  UserApiModel({this.userInfo, this.success, this.message});

  UserApiModel.fromJson(Map<String, dynamic> json) {
    userInfo = UserModel.fromJson(json['user_info']);

    success = json['success'];
    message = json['message'];
  }
}
