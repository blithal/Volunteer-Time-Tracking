import 'dart:convert';

List<Event> userFromJson(String str) =>
    List<Event>.from(json.decode(str).map((x) => Event.fromJson(x)));

String eventToJson(List<Event> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Event {
  Event({
    required this.name,
    required this.description,
    required this.startDate,
    required this.startTime,
    required this.completed,
  });

  String name;
  bool description;
  bool startDate;
  String startTime;
  String completed;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        name: json["name"],
        description: json["description"],
        startDate: json["startDate"],
        startTime: json["startTime"],
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "startDate": startDate,
        "startTime": startTime,
        "completed": completed,
      };
}