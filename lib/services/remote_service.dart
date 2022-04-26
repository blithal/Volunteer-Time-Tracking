import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:volunteer_time_tracking/models/eventInfo.dart';
import 'package:volunteer_time_tracking/models/userInfo.dart';
import 'package:http/http.dart' as http;
import 'package:volunteer_time_tracking/models/login_info.dart';
import 'package:volunteer_time_tracking/bloc_login/model/user.dart';
import 'package:volunteer_time_tracking/user_registration.dart';

class RemoteService {
  Future<List<UserInfo>?> getUsersInfo(User user) async {
    var client = http.Client();

    var uri = Uri.parse("http://127.0.0.1:8000/userdetails?format=json");
    // var response = await client.get(uri, headers: {
    //   "Content-Type": 'application/x-www-form-urlencoded',
    //   "Authorization": user.token
    // });
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return userInfoFromJson(json);
    }
  }

  Future<UserInfo> getUserInfo(User user) async {
    var client = http.Client();
    var urlString = "http://127.0.0.1:8000/userdetails/" +
        user.id.toString() +
        "?format=json";
    var uri = Uri.parse(urlString);
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      // List<UserInfo> users = userInfoFromJson(json);
      // UserInfo temp = UserInfo.defaultUser();
      // users.forEach((u) {
      //   if (u.id == user.id) {
      //     temp = u;
      //   }
      // });
      // return temp;
      //List<UserInfo> temps = userInfoFromJson(json);
      UserInfo temp =
          UserInfo.fromJson(jsonDecode(json) as Map<String, dynamic>);
      return temp;
    } else {
      return UserInfo.defaultUser();
    }
  }

  Future<bool?> createEvent(String name, String description, DateTime startDate,
      String startTime) async {
    var client = http.Client();

    var formatter = new DateFormat("yyyy-MM-dd");
    var uri = Uri.parse("http://127.0.0.1:8000/events/events");
    var body = jsonEncode({
      "name": name,
      "description": description,
      "startDate": formatter.format(startDate).toString(),
      "startTime": startTime
    });
    var response = await client
        .post(uri, body: body, headers: {"Content-Type": "application/json"});
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<String?> createUserToken(String username, String firstName,
      String lastName, String email, String password) async {
    var client = http.Client();
    var uri = Uri.parse("http://127.0.0.1:8000/api/user/");
    var body = jsonEncode({
      "username": username,
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "password": password
    });
    var response = await client
        .post(uri, body: body, headers: {"Content-Type": "application/json"});
    if (response.statusCode == 201) {
      return "success";
    }
    if (response.statusCode == 400) {
      var temp = jsonDecode(response.body);
      return temp.toString();
    }
  }

  Future<bool> isUserAdmin(User user) async {
    UserInfo info = await getUserInfo(user);
    if (info.isAdmin) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<EventInfo>?> GetEvents() async {
    var client = http.Client();

    var uri = Uri.parse("http://127.0.0.1:8000/events?format=json");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return eventFromJson(json);
    }
  }

  Future<bool> CreateEvent(String name, String description, String date,
      String time, bool completed, String organizer, String location) async {
    var client = http.Client();

    var uri = Uri.parse("http://127.0.0.1:8000/events");
    var body = json.encode({
      "name": name,
      "description": description,
      "startDate": DateTime.parse(date),
      "startTime": time,
      "completed": completed,
      "organizer": organizer,
      "location": location
    });
    var response = await client.post(uri, body: body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> UpdateEvent(
      int eventId,
      String name,
      String description,
      String date,
      String time,
      bool completed,
      String organizer,
      String location) async {
    var client = http.Client();

    var uri = Uri.parse("http://127.0.0.1:8000/events");
    var body = json.encode({
      "id": eventId,
      "name": name,
      "description": description,
      "startDate": DateTime.parse(date),
      "startTime": time,
      "completed": completed,
      "organizer": organizer,
      "location": location
    });
    var response = await client.post(uri, body: body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
