import 'dart:convert';

List<Report> userFromJson(String str) =>
    List<Report>.from(json.decode(str).map((x) => Report.fromJson(x)));

String reportToJson(List<Report> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Report {
  Report({
    required this.id,
    required this.volunteerName,
    required this.text,
  });

  String id;
  String volunteerName;
  String text;

  factory Report.fromJson(Map<String, dynamic> json) => Report(
        id: json["id"],
        volunteerName: json["volunteerName"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "volunteerName": volunteerName,
        "text": text,
      };
}