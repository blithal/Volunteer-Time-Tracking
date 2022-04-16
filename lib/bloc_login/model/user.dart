// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  int id;
  String username;
  String token;

  User({required this.id, required this.username, required this.token});

  factory User.fromJson(Map<String, dynamic> json) =>
      User(id: json["id"], username: json['username'], token: json['token']);

  Map<String, dynamic> toJson() =>
      {"id": this.id, "username": this.username, "token": this.token};
}
