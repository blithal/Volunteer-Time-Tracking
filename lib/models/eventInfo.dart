import 'dart:convert';

List<EventInfo> eventFromJson(String str) =>
    List<EventInfo>.from(json.decode(str).map((x) => EventInfo.fromJson(x)));

String eventToJson(List<EventInfo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EventInfo {
  EventInfo({
    required this.id,
    required this.organizer,
    required this.name,
    required this.description,
    required this.startDate,
    required this.startTime,
    required this.location,
    required this.completed,
  });

  EventInfo.defaultEvent(
      {this.id = -1,
      this.organizer = "",
      this.name = "",
      this.description = "",
      this.startDate = "",
      this.startTime = "",
      this.location = "",
      this.completed = false});

  int id;
  String organizer;
  String name;
  String description;
  String startDate;
  String startTime;
  String location;
  bool completed;

  factory EventInfo.fromJson(Map<String, dynamic> json) => EventInfo(
        id: json["id"],
        organizer: json["organizer"],
        name: json["name"],
        description: json["description"],
        startDate: json["startDate"],
        startTime: json["startTime"],
        location: json["location"],
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "organizer": organizer,
        "name": name,
        "description": description,
        "startDate": startDate,
        "startTime": startTime,
        "location": location,
        "completed": completed,
      };
}
