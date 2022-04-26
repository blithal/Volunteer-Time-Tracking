import 'dart:html';

import 'package:flutter/material.dart';
import 'package:volunteer_time_tracking/UserSettings.dart';
import 'package:volunteer_time_tracking/bloc_login/login/login_page.dart';
import 'package:volunteer_time_tracking/bloc_login/repository/user_repository.dart';
import 'package:volunteer_time_tracking/clockinclockout.dart';
import 'package:volunteer_time_tracking/main.dart';
import 'package:volunteer_time_tracking/theme/volunteerTheme.dart';
import 'package:volunteer_time_tracking/user_account.dart';
import 'package:volunteer_time_tracking/user_completed.dart';
import 'package:volunteer_time_tracking/user_enrolled.dart';
import 'package:volunteer_time_tracking/user_home.dart';
import 'package:volunteer_time_tracking/bloc_login/model/user.dart';

class UserRegistration extends StatelessWidget {
  const UserRegistration({Key? key, required this.currUserId})
      : super(key: key);

  final User currUserId;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:
          'User Registration Page - Fayetteville Public Library Volunteer System',
      theme: VolunteerTheme.lightTheme,
      home: UserRegistrationPage(
        title:
            'Fayetteville Public Library Volunteer System - User Account Page',
        currUserId: currUserId,
      ),
    );
  }
}

class UserRegistrationPage extends StatefulWidget {
  const UserRegistrationPage(
      {Key? key, required this.title, required this.currUserId})
      : super(key: key);

  final String title;
  final User currUserId;

  @override
  State<UserRegistrationPage> createState() => _UserRegistrationPage();
}

class EventsInfo {
  String event, date, description, orginizer, start, end, address;
  EventsInfo(
      {required this.event,
      required this.date,
      required this.description,
      required this.orginizer,
      required this.start,
      required this.end,
      required this.address});
}

class VolunteerCard extends StatefulWidget {
  final String name;
  final String date;
  final String description;
  final String organizerName;
  final String startTime;
  final String endTime;
  final String location;

  const VolunteerCard(this.name, this.date, this.description,
      this.organizerName, this.startTime, this.endTime, this.location);

  @override
  State<VolunteerCard> createState() => _VolunteerCardState();
}

class _VolunteerCardState extends State<VolunteerCard> {
  bool isVisible = true;

  void updatePage() {
    setState(() {});
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
    return Visibility(
      visible: isVisible,
      child: Container(
          width: displayWidth(context) * .70,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            color: const Color.fromARGB(255, 100, 105, 111),
            border: Border.all(color: Colors.grey),
          ),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Column(children: [
                  Container(
                    width: displayWidth(context) * .50,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(),
                    child: Text(
                      widget.name,
                      textAlign: TextAlign.left,
                      style: const TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                  Container(
                    width: displayWidth(context) * .50,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 0, 46, 70),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Text(
                      "Organizer: " + widget.organizerName,
                      textAlign: TextAlign.left,
                      style: const TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                ]),
                const SizedBox(width: 10),
                Column(children: [
                  Container(
                    width: displayWidth(context) * .15,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 113, 200, 184),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10))),
                    child: Text(
                      widget.date,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                  Container(
                    width: displayWidth(context) * .15,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 113, 200, 184),
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10))),
                    child: Text(
                      widget.startTime + "-" + widget.endTime,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                ]),
              ]),
              const SizedBox(height: 10),
              Container(
                width: displayWidth(context) * .66,
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 126, 148, 203),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Text(
                  "Location: " + widget.location,
                  textAlign: TextAlign.left,
                  style: const TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: displayWidth(context) * .66,
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 126, 148, 203),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Text(
                  "Information: " + widget.description,
                  textAlign: TextAlign.left,
                  style: const TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              Container(
                  padding: const EdgeInsets.all(10),
                  width: displayWidth(context) * .66,
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isVisible = false; // hide card when user signs up for event
                        });
                      },
                      child: const Text('Sign up'))),
            ],
          )),
    );
  }
}

class _UserRegistrationPage extends State<UserRegistrationPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<EventsInfo> events = [
    EventsInfo(
        event: "test1",
        date: "1-1-22",
        description: "test description 1",
        orginizer: "john doe",
        start: "8:00am",
        end: "9:00pm",
        address: "0000 N Empty St Fayetteville, Arkansas 72701"),
    EventsInfo(
        event: "test2",
        date: "1-2-22",
        description: "test description 2",
        orginizer: "jane doe",
        start: "8:10am",
        end: "9:10pm",
        address: "0001 N Empty St Fayetteville, Arkansas 72701"),
    EventsInfo(
        event: "test3",
        date: "1-3-22",
        description: "test description 3",
        orginizer: "Kagen Crouch",
        start: "8:20am",
        end: "9:20pm",
        address: "0002 N Empty St Fayetteville, Arkansas 72701"),
  ];

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
      body: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 10) /*Spacing for user*/,
                  Container(
                    width: displayWidth(context) * .70,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Volunteer Opportunities',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  const SizedBox(height: 10) /*Spacing for user*/,
                  Column(
                    children: events.map((eventone) {
                      return ListTile(
                          title: SizedBox(
                              child: VolunteerCard(
                                  eventone.event,
                                  eventone.date,
                                  eventone.description,
                                  eventone.orginizer,
                                  eventone.start,
                                  eventone.end,
                                  eventone.address)));
                    }).toList(),
                  )
                ],
              ),
            ),
          )),
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
              Navigator.pop(context);
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UserCompleted(
                            currUserId: widget.currUserId,
                          )));
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
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UserSettings(
                            user: widget.currUserId,
                          )));
            },
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginPage(
                            userRepository: UserRepository(),
                          )));
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
