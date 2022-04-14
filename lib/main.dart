import 'dart:io';

import 'package:flutter/material.dart';
import 'package:volunteer_time_tracking/SignUp.dart';
import 'package:http/http.dart' as http;
import 'package:volunteer_time_tracking/theme/volunteerTheme.dart';
import 'package:volunteer_time_tracking/user_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page - Fayetteville Public Library Volunteer System',
      theme: VolunteerTheme.lightTheme,
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => Home(),
      // },
      home: const MyHomePage(title: 'Volunteer System Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  Size displaySize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  double displayHeight(BuildContext context) {
    return displaySize(context).height;
  }

  double displayWidth(BuildContext context) {
    if (displaySize(context).width > 1000) {
      return 1000;
    }
    return displaySize(context).width;
  }

  postData() async {
    try {
      var response = await http
          .post(Uri.parse("http://127.0.0.1:8000/userdetails"), body: {
        "firstName": usernameController.text,
        "lastName": passwordController.text,
      });
      return response.body;
    } catch (e) {
      return e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset('graphics/library_logo_name.png',
                height: 60, width: 150.0),
            const SizedBox(width: 10),
            Text(widget.title),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10),
              child: const Text('Login', style: TextStyle(fontSize: 25)),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              width: displayWidth(context) * .5,
              child: TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              width: displayWidth(context) * .5,
              child: TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            Container(
                padding: const EdgeInsets.all(10),
                width: displayWidth(context) * .5,
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignUp()),
                      );
                    },
                    child: const Text('Create an account'))),
            Container(
                padding: const EdgeInsets.all(10),
                width: displayWidth(context) * .5,
                child: ElevatedButton(
                  onPressed: () {
                    //postData();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const UserHome()),
                    );
                  }, // verify login creditionals (change later)
                  child: const Text(
                    'Login',
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
