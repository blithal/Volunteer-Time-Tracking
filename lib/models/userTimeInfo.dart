import 'dart:convert';

List<UserTimeInfo> userTimeInfoFromJson(String str) =>
    List<UserTimeInfo>.from(json.decode(str).map((x) => UserTimeInfo.fromJson(x)));

String userTimeInfoToJson(List<UserTimeInfo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserTimeInfo {
  UserTimeInfo({
    required this.userId,
    required this.clockIn,
    required this.clockOut,
    required this.date,
    required this.dateModified,
    required this.modifiedByUser,
  });

  UserTimeInfo.defaultUser({
    this.userId = -1,
    this.clockIn = "",
    this.clockOut = "",
    this.date = "",
    this.dateModified = "",
    this.modifiedByUser = -1,
  });

  int userId;
  String clockIn;
  String clockOut;
  String date;
  String dateModified;
  int modifiedByUser;

  factory UserTimeInfo.fromJson(Map<String, dynamic> json) => UserTimeInfo(
        userId: json["userId"],
        clockIn: json["clockIn"],
        clockOut: json["clockOut"],
        date: json["date"],
        dateModified: json["dateModified"],
        modifiedByUser: json["modifiedByUser"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "clockIn": clockIn,
        "clockOut": clockOut,
        "date": date,
        "dateModified": dateModified,
        "dateModifiedByUser": modifiedByUser,
      };
}