import 'dart:convert';

List<Event> userFromJson(String str) =>
    List<Event>.from(json.decode(str).map((x) => Event.fromJson(x)));

String eventToJson(List<Event> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Event {
  Event({
    required this.id,
    required this.name,
    required this.description,
    required this.startDate,
    required this.startTime,
    required this.completed,
  });

  int id;
  String name;
  String description;
  DateTime startDate;
  String startTime;
  bool completed;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        startDate: json["startDate"],
        startTime: json["startTime"],
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "startDate": startDate,
        "startTime": startTime,
        "completed": completed,
      };
}
