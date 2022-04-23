import 'dart:convert';

<<<<<<< HEAD
import 'package:volunteer_time_tracking/models/event.dart';
import 'package:volunteer_time_tracking/models/user.dart';
import 'package:volunteer_time_tracking/models/userTimeInfo.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:intl/intl.dart';
=======
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:volunteer_time_tracking/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:volunteer_time_tracking/models/report.dart';
>>>>>>> 090261ddad1b582564c7d8a22fc09472a382b6f8

class RemoteService {
  Future<List<User>?> getUsers() async {
    var client = http.Client();

    var uri = Uri.parse("http://127.0.0.1:8000/userdetails?format=json");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return userFromJson(json);
    }
  }

<<<<<<< HEAD
  Future<bool?> createReport(String id, String volunteerName, String text) 
  async {
    var client = http.Client();

    var uri = Uri.parse("http://127.0.0.1:8000/report/report");
    var body = jsonEncode({
      "id": id,
      "volunteerName": volunteerName,
      "text": text
    });
    var response = await client
        .post(uri, body: body, headers: {"Content-Type": "application/json"});
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool?> addTimeInfo(int userId, String clockIn, String clockOut, String date, 
  String dateModified, int modifiedByUser) async {
    var client = http.Client();
    
    var uri = Uri.parse("http://127.0.0.1:8000/userTime/userTime");
    var body = jsonEncode({
      "userId": userId, 
      "clockIn": clockIn,
      "clockOut": clockOut,
      "date": date,
      "dateModified": dateModified,
      "modifiedByUser": modifiedByUser
    });

    var response = await client
          .post(uri, body: body, headers: {"Content-Type": "application/json"});
=======
  Future<User?> getUser(String userId) async {
    var client = http.Client();

    var uri = Uri.parse("http://127.0.0.1:8000/userdetails?format=json");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      List<User> users = userFromJson(json);
      User user = User.defaultUser();
      users.forEach((u) {
        if (u.id.toString() == userId) {
          user = u;
        }
      });
      return user;
    }
  }

  Future<List<User>?> createUser(
      String firstName, String lastName, String email) async {
    var client = http.Client();

    var uri = Uri.parse("http://127.0.0.1:8000/userdetails");
    var response = await client.post(uri,
        body: {"firstName": firstName, "lastName": lastName, "email": email});
    if (response.statusCode == 201) {
      return getUsers();
    }
  }

  Future<bool?> createLogin(
      String userId, String username, String password) async {
    var client = http.Client();

    var uri = Uri.parse("http://127.0.0.1:8000/logindetails");
    print("creating login...\nUserId: " +
        userId +
        "\nUsername: " +
        username +
        "\nPassword: " +
        password);
    var response = await client.post(uri,
        body: {"userId": userId, "username": username, "password": password});
    if (response.statusCode == 201) {
      return true;
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
>>>>>>> 090261ddad1b582564c7d8a22fc09472a382b6f8
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

<<<<<<< HEAD
  Future<List<UserTimeInfo>?> getUserTimeInfo() async {
    var client = http.Client();

    var uri = Uri.parse("http://127.0.0.1:8000/userdetails?format=json");
    var response = await client.get(uri, headers: {
      "Content-Type": 'application/x-www-form-urlencoded'/*,
      "Authorization": user.token*/
    });
    if (response.statusCode == 200) {
      var json = response.body;
      return userTimeInfoFromJson(json);
    }
  }

  Future<List<Event>?> getEventInfo() async {
    var client = http.Client();

    var uri = Uri.parse("http://127.0.0.1:8000/events?format=json");
    var response = await client.get(uri, headers: {
      "Content-Type": 'application/x-www-form-urlencoded'/*,
      "Authorization": user.token*/
    });
    if (response.statusCode == 200) {
      var json = response.body;
      return eventFromJson(json);
    }
  }

}
=======
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

  Future<bool?> createReport(String id, String volunteerName, String text) 
  async {
    var client = http.Client();

    var formatter = new DateFormat("yyyy-MM-dd");
    var uri = Uri.parse("http://127.0.0.1:8000/report/report");
    var body = jsonEncode({
      "id": id,
      "volunteerName": volunteerName,
      "text": text
    });
    var response = await client
        .post(uri, body: body, headers: {"Content-Type": "application/json"});
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
>>>>>>> 090261ddad1b582564c7d8a22fc09472a382b6f8
