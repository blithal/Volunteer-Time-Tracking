import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:volunteer_time_tracking/bloc_login/model/api_model.dart';

final _tokenURL = "http://127.0.0.1:8000/api-token-auth/";

Future<Token> getToken(UserLogin userLogin) async {
  final http.Response response = await http.post(
    Uri.parse(_tokenURL),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(userLogin.toDatabaseJson()),
  );
  if (response.statusCode == 200) {
    return Token.fromJson(json.decode(response.body));
  } else {
    print(json.decode(response.body).toString());
    throw Exception(json.decode(response.body));
  }
}
