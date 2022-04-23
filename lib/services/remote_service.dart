import 'dart:convert';

import 'package:volunteer_time_tracking/models/event.dart';
import 'package:volunteer_time_tracking/models/user.dart';
import 'package:volunteer_time_tracking/models/userTimeInfo.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:intl/intl.dart';

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
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

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
