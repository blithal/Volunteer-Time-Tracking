import 'package:http/http.dart';
import 'package:volunteer_time_tracking/user.dart';
import 'package:http/http.dart' as http;

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
}
