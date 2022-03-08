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
    required this.name,
    required this.volunteerAdmin,
    required this.active,
  });

  String name;
  bool volunteerAdmin;
  bool active;

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        volunteerAdmin: json["volunteerAdmin"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "volunteerAdmin": volunteerAdmin,
        "active": active,
      };
}
