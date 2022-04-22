// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:volunteer_time_tracking/theme/volunteerTheme.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign Up Page - Fayetteville Public Library Volunteer System',
      theme: VolunteerTheme.lightTheme,
      home: Scaffold(
        body: const MyStatefulWidget(
          title: 'Volunteer System Sign Up',
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
        body: Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(10),
              child: Center(
                  child: Column(
                children: <Widget>[
                  Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 25),
                      )),
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: displayWidth(context) * .5,
                    child: TextField(
                      controller: firstName,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'First Name',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: displayWidth(context) * .5,
                    child: TextField(
                      controller: lastName,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Last Name',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: displayWidth(context) * .5,
                    child: TextField(
                      controller: userName,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'User Name',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: displayWidth(context) * .5,
                    child: TextField(
                      obscureText: true,
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
                      child: ElevatedButton(
                        child: const Text('Sign Up'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )),
                ],
              )),
            )));
  }
}
