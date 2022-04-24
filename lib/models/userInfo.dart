// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<UserInfo> userInfoFromJson(String str) =>
    List<UserInfo>.from(json.decode(str).map((x) => UserInfo.fromJson(x)));

String userInfoToJson(List<UserInfo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserInfo {
  UserInfo({
    required this.id,
    required this.firstName,
    required this.isAdmin,
    required this.isActive,
    required this.email,
    required this.lastName,
    required this.phone,
  });

  UserInfo.defaultUser({
    this.id = -1,
    this.firstName = "",
    this.isAdmin = false,
    this.isActive = false,
    this.email = "",
    this.lastName = "",
    this.phone = "",
  });

  int id;
  String firstName;
  bool isAdmin;
  bool isActive;
  String email;
  String lastName;
  String phone;

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        id: json["id"],
        firstName: json["firstName"],
        isAdmin: json["isAdmin"],
        isActive: json["isActive"],
        email: json["email"],
        lastName: json["lastName"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "isAdmin": isAdmin,
        "isActive": isActive,
        "email": email,
        "lastName": lastName,
        "phone": phone,
      };
}
