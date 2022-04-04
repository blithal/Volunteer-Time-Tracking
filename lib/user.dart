// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    required this.id,
    required this.firstName,
    required this.isAdmin,
    required this.isActive,
    required this.email,
    required this.lastName,
    required this.phone,
  });

  int id;
  String firstName;
  bool isAdmin;
  bool isActive;
  String email;
  String lastName;
  String phone;

  factory User.fromJson(Map<String, dynamic> json) => User(
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
