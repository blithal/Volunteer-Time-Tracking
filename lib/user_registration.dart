import 'package:flutter/material.dart';

class UserRegistration extends StatelessWidget {
  const UserRegistration({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:
          'User Registration Page - Fayetteville Public Library Volunteer System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const UserRegistrationPage(
          title:
              'Fayetteville Public Library Volunteer System - User Account Page'),
    );
  }
}

class UserRegistrationPage extends StatefulWidget {
  const UserRegistrationPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<UserRegistrationPage> createState() => _UserRegistrationPage();
}

class _UserRegistrationPage extends State<UserRegistrationPage> {
  Size displaySize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  double displayHeight(BuildContext context) {
    return displaySize(context).height;
  }

  double displayWidth(BuildContext context) {
    return displaySize(context).width;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 10) /*Spacing for user*/,
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              /*Area for name*/
              Container(
                width: displayWidth(context) * .25,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Hello World',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
