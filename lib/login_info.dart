// To parse this JSON data, do
//
//     final loginInfo = loginInfoFromJson(jsonString);

import 'dart:convert';

List<LoginInfo> loginInfoFromJson(String str) =>
    List<LoginInfo>.from(json.decode(str).map((x) => LoginInfo.fromJson(x)));

String loginInfoToJson(List<LoginInfo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LoginInfo {
  LoginInfo({
    required this.userId,
    required this.username,
    required this.password,
  });

  String userId;
  String username;
  String password;

  factory LoginInfo.fromJson(Map<String, dynamic> json) => LoginInfo(
        userId: json["userId"],
        username: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "username": username,
        "password": password,
      };
}
