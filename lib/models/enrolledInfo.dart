// To parse this JSON data, do
//
//     final enrolledInfo = enrolledInfoFromJson(jsonString);

import 'dart:convert';

List<EnrolledInfo> enrolledInfoFromJson(String str) => List<EnrolledInfo>.from(
    json.decode(str).map((x) => EnrolledInfo.fromJson(x)));

String enrolledInfoToJson(List<EnrolledInfo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EnrolledInfo {
  EnrolledInfo({
    required this.id,
    required this.userId,
    required this.eventId,
  });

  EnrolledInfo.defaultEnrolledInfo(
      {this.id = -1, this.userId = -1, this.eventId = -1});

  int id;
  int userId;
  int eventId;

  factory EnrolledInfo.fromJson(Map<String, dynamic> json) => EnrolledInfo(
        id: json["id"],
        userId: json["userId"],
        eventId: json["eventId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "eventId": eventId,
      };
}
