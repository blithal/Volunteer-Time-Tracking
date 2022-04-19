import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:volunteer_time_tracking/models/userInfo.dart';
import 'package:http/http.dart' as http;
import 'package:volunteer_time_tracking/models/login_info.dart';
import 'package:volunteer_time_tracking/bloc_login/model/user.dart';

class RemoteService {
  Future<List<UserInfo>?> getUsersInfo(User user) async {
    var client = http.Client();

    var uri = Uri.parse("http://127.0.0.1:8000/userdetails?format=json");
    var response = await client.get(uri, headers: {
      "Content-Type": 'application/x-www-form-urlencoded',
      "Authorization": user.token
    });
    if (response.statusCode == 200) {
      var json = response.body;
      return userInfoFromJson(json);
    }
  }

  Future<UserInfo?> getUserInfo(User user) async {
    var client = http.Client();

    var uri = Uri.parse("http://127.0.0.1:8000/userdetails?format=json");
    var response = await client.get(uri, headers: {
      "Content-Type": 'application/x-www-form-urlencoded',
      "Authorization": user.token
    });
    if (response.statusCode == 200) {
      var json = response.body;
      List<UserInfo> users = userInfoFromJson(json);
      UserInfo? temp = null;
      users.forEach((u) {
        if (u.id == user.id) {
          temp = u;
        }
      });
      return temp;
    }

    // var uri = Uri.parse("http://127.0.0.1:8000/userdetails?format=json");
    // var response = await client.get(uri);
    // if (response.statusCode == 200) {
    //   var json = response.body;
    //   List<UserInfo> users = userFromJson(json);
    //   UserInfo user = UserInfo.defaultUser();
    //   users.forEach((u) {
    //     if (u.id.toString() == userId) {
    //       user = u;
    //     }
    //   });
    //   return user;
    // }
  }

  // Future<List<LoginInfo>?> getLogins() async {
  //   var client = http.Client();

  //   var uri = Uri.parse("http://127.0.0.1:8000/logindetails?format=json");
  //   var response = await client.get(uri);
  //   if (response.statusCode == 200) {
  //     var json = response.body;
  //     return loginInfoFromJson(json);
  //   }
  // }

  // Future<List<User>?> createUser(
  //     String firstName, String lastName, String email) async {
  //   var client = http.Client();

  //   var uri = Uri.parse("http://127.0.0.1:8000/userdetails");
  //   var response = await client.post(uri,
  //       body: {"firstName": firstName, "lastName": lastName, "email": email});
  //   if (response.statusCode == 201) {
  //     return getUsers();
  //   }
  // }

  // Future<bool?> createLogin(
  //     String userId, String username, String password) async {
  //   var client = http.Client();

  //   var uri = Uri.parse("http://127.0.0.1:8000/logindetails");
  //   print("creating login...\nUserId: " +
  //       userId +
  //       "\nUsername: " +
  //       username +
  //       "\nPassword: " +
  //       password);
  //   var response = await client.post(uri,
  //       body: {"userId": userId, "username": username, "password": password});
  //   if (response.statusCode == 201) {
  //     return true;
  //   }
  // }

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
}
