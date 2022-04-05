import 'package:http/http.dart';
import 'package:volunteer_time_tracking/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:volunteer_time_tracking/models/login_info.dart';

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

  Future<List<LoginInfo>?> getLogins() async {
    var client = http.Client();

    var uri = Uri.parse("http://127.0.0.1:8000/logindetails?format=json");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return loginInfoFromJson(json);
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
}
