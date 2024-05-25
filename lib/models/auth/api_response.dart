import 'package:atma_kitchen/models/auth/user.dart';

class BaseApiResponse {
  bool? success;
  String? message;

  BaseApiResponse({this.success, this.message});

  BaseApiResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
  }
}

class LoginResponse {
  bool? success;
  String? message;
  User? user;
  String? token;

  LoginResponse({this.success, this.message, this.user, this.token});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      user = User.fromJson(json['data']['user']);
      token = json['data']['token'];
    }
  }
}
