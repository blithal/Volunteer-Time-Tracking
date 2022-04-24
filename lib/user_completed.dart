import 'dart:html';

import 'package:flutter/material.dart';
import 'package:volunteer_time_tracking/main.dart';
import 'package:volunteer_time_tracking/user_account.dart';
import 'package:volunteer_time_tracking/user_enrolled.dart';
import 'package:volunteer_time_tracking/user_home.dart';
import 'package:volunteer_time_tracking/user_registration.dart';
import 'package:volunteer_time_tracking/bloc_login/model/user.dart';

class UserCompleted extends StatelessWidget {
  const UserCompleted({Key? key, required this.currUserId}) : super(key: key);

  final User currUserId;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User History Page - Fayetteville Public Library Volunteer System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserCompletedPage(
        title:
            'Fayetteville Public Library Volunteer System - User History Page',
        currUserId: currUserId,
      ),
    );
  }
}

class UserCompletedPage extends StatefulWidget {
  const UserCompletedPage(
      {Key? key, required this.title, required this.currUserId})
      : super(key: key);

  final String title;
  final User currUserId;

  @override
  State<UserCompletedPage> createState() => _UserCompletedPage();
}

class _UserCompletedPage extends State<UserCompletedPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget volunteerCard(
      String name,
      String date,
      String description,
      String organizerName,
      String startTime,
      String endTime,
      String loca,
      String timeRecorded) {
    return Container(
        width: displayWidth(context) * .70,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          color: const Color.fromARGB(255, 167, 206, 238),
          border: Border.all(color: Colors.grey),
        ),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Column(children: [
                Container(
                  width: displayWidth(context) * .50,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 238, 237, 167),
                  ),
                  child: Text(
                    name,
                    textAlign: TextAlign.left,
                    style: const TextStyle(fontSize: 17),
                  ),
                ),
                Container(
                  width: displayWidth(context) * .50,
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Organizer: " + organizerName,
                    textAlign: TextAlign.left,
                    style: const TextStyle(fontSize: 13),
                  ),
                ),
              ]),
              const SizedBox(width: 10),
              Column(children: [
                Container(
                  width: displayWidth(context) * .15,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 187, 238, 167),
                  ),
                  child: Text(
                    date,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 13),
                  ),
                ),
                Container(
                  width: displayWidth(context) * .15,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 187, 238, 167),
                  ),
                  child: Text(
                    startTime + "-" + endTime,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 13),
                  ),
                ),
              ]),
            ]),
            const SizedBox(height: 10),
            Container(
              width: displayWidth(context) * .66,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 238, 184, 167),
              ),
              child: Text(
                "Location: " + loca,
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 13),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: displayWidth(context) * .66,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 238, 184, 167),
              ),
              child: Text(
                description,
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 15),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: displayWidth(context) * .66,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 238, 184, 167),
              ),
              child: Text(
                "Time Recorded: " + timeRecorded,
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 15),
              ),
            )
          ],
        ));
  }

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
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 10) /*Spacing for user*/,
            Container(
              width: displayWidth(context) * .70,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Volunteer History',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 25),
              ),
            ),
            const SizedBox(height: 10) /*Spacing for user*/,
            volunteerCard(
                "Title",
                "01-01-22",
                "This is an example description. This is to be used just as a placeholder for a real description for volunteer opportunities. The placeholder also tests the width constrainst of the text box.",
                "John Doe",
                "8:00am",
                "4:00pm",
                "0000 N Empty St Fayetteville, Arkansas 72701",
                "0h 0m 0s"),
          ],
        ),
      ),

      /* Page Navagation */
      drawer: Drawer(
          child: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          const SizedBox(height: 10) /*Spacing for user*/,
          TextButton.icon(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 17),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UserHome(
                            user: widget.currUserId,
                          )));
            },
            icon: const Icon(
              Icons.home,
              size: 20,
            ),
            label: const Text('Home'),
          ),
          const SizedBox(height: 10) /*Spacing for user*/,
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 17),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UserRegistration(
                            currUserId: widget.currUserId,
                          )));
            },
            child: const Text('Volunteer Opportunities'),
          ),
          const SizedBox(height: 10) /*Spacing for user*/,
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 17),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UserEnrolled(
                            currUserId: widget.currUserId,
                          )));
            },
            child: const Text('Currently Enrolled'),
          ),
          const SizedBox(height: 10) /*Spacing for user*/,
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 17),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Volunteer History'),
          ),
          const SizedBox(height: 25) /*Spacing for user*/,
          TextButton.icon(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 17),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UserAccount(
                            user: widget.currUserId,
                          )));
            },
            icon: const Icon(
              Icons.account_circle,
              size: 20,
            ),
            label: const Text('Account'),
          ),
          const SizedBox(height: 10) /*Spacing for user*/,
          TextButton.icon(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 17),
            ),
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              size: 20,
            ),
            label: const Text('Settings'),
          ),
          const SizedBox(height: 10) /*Spacing for user*/,
          TextButton.icon(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 17),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyApp()));
            },
            icon: const Icon(
              Icons.logout,
              size: 20,
            ),
            label: const Text('Logout'),
          ),
        ],
      )),
    );
  }
}
