import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:volunteer_time_tracking/models/userInfo.dart';
import 'package:http/http.dart' as http;

class UserProvider with ChangeNotifier {
  UserProvider() {
    this.fetchUsers();
  }

  List<UserInfo> _users = [];

  List<UserInfo> get users {
    return [..._users];
  }

  fetchUsers() async {
    final url = "http://127.0.0.1:8000/userdetails?format=json";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      _users = data.map<UserInfo>((json) => UserInfo.fromJson(json)).toList();
    }
  }
}
