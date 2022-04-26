import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:volunteer_time_tracking/models/userInfo.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  late Future<List<UserInfo>> users;
  final userListKey = GlobalKey<HomeState>();

  @override
  void initState() {
    super.initState();
    // users = getUserList();
  }

  // Future<List<User>> getUserList() async {
  //   final response = await http.get(Uri.parse("${Env.URL_PREFIX}userdetails"));

  //   final items = json.decode(response.body).cast<Map<String, dynamic>>();
  //   List<User> users = items.map<User>((json) {
  //     return User.fromJson(json);
  //   }).toList();
  //   return users;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: userListKey,
      appBar: AppBar(
          // title: Text(getUserList().toString()),
          ),
      body: Center(
        child: FutureBuilder<List<UserInfo>>(
          // future: getUserList(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                var data = snapshot.data[index];
                return Card(
                  child: ListTile(
                    leading: Icon(Icons.person),
                    title: Text(
                      data.name,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
