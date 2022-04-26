//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:volunteer_time_tracking/UserSettings.dart';
import 'package:volunteer_time_tracking/bloc_login/login/login_page.dart';
import 'package:volunteer_time_tracking/bloc_login/repository/user_repository.dart';
import 'package:volunteer_time_tracking/main.dart';
import 'package:volunteer_time_tracking/models/enrolledInfo.dart';
import 'package:volunteer_time_tracking/models/eventInfo.dart';
import 'package:volunteer_time_tracking/services/remote_service.dart';
import 'package:volunteer_time_tracking/theme/volunteerTheme.dart';
import 'package:volunteer_time_tracking/user_account.dart';
import 'package:volunteer_time_tracking/user_completed.dart';
import 'package:volunteer_time_tracking/user_home.dart';
import 'package:volunteer_time_tracking/user_registration.dart';
import 'package:volunteer_time_tracking/bloc_login/model/user.dart';

class UserEnrolled extends StatelessWidget {
  const UserEnrolled({Key? key, required this.currUserId}) : super(key: key);

  final User currUserId;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:
          'User Enrolled Page - Fayetteville Public Library Volunteer System',
      theme: VolunteerTheme.lightTheme,
      home: UserEnrolledPage(
        title:
            'Fayetteville Public Library Volunteer System - User Enrolled Page',
        currUserId: currUserId,
      ),
    );
  }
}

class UserEnrolledPage extends StatefulWidget {
  const UserEnrolledPage(
      {Key? key, required this.title, required this.currUserId})
      : super(key: key);

  final String title;
  final User currUserId;

  @override
  State<UserEnrolledPage> createState() => _UserEnrolledPage();
}

class EventEnrolled {
  String event, date, description, orginizer, start, end, address;
  EventEnrolled({
    required this.event,
    required this.date,
    required this.description,
    required this.orginizer,
    required this.start,
    required this.end,
    required this.address,
  });
}

class _UserEnrolledPage extends State<UserEnrolledPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<EnrolledInfo> events = [];
  List<EventInfo> eventsEnrolled = [];
  bool eventsLoaded = false;

  @override
  void initState() {
    super.initState();
    getEnrolled();
  }

  getEnrolled() async {
    List<EventInfo>? temp = await RemoteService().GetEvents();
    List<EnrolledInfo>? temp2 = await RemoteService().GetEnrollInfo();
    if (temp != null && temp2 != null) {
      List<int> eventsEnrolledIds = [];
      temp2.forEach((element) {
        if (element.userId == widget.currUserId.id) {
          eventsEnrolledIds.add(element.eventId);
        }
      });
      temp.forEach((element) {
        if (eventsEnrolledIds.contains(element.id)) {
          eventsEnrolled.add(element);
        }
      });
      setState(() {
        eventsLoaded = true;
      });
    }
  }

  // getEnrolled() async {
  //   List<EnrolledInfo>? testEvents = await RemoteService().GetEnrollInfo();
  //   testEvents!.forEach((e) {
  //     if (e.userId == widget.currUserId.id) {
  //       events!.add(e);
  //     }
  //   });
  //   getEvents(events!);
  // }

  // getEvents(List<EnrolledInfo> enrolledEvents) async {
  //   await Future.forEach(enrolledEvents, (EnrolledInfo element) async {
  //     EventInfo enrollEventInfo =
  //         await RemoteService().GetEvent(element.eventId);
  //     eventsEnrolled!.add(enrollEventInfo);
  //   });
  //   if (eventsEnrolled != null) {
  //     setState(() {
  //       eventsLoaded = true;
  //     });
  //   }
  // }

  Widget volunteerCard(String name, String date, String description,
      String organizerName, String startTime, String loca, bool completed) {
    return Container(
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
                    name,
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
                    "Organizer: " + organizerName,
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
                    date,
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
                    startTime,
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
                "Location: " + loca,
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
                "Information: " + description,
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
            Container(
                padding: const EdgeInsets.all(10),
                width: displayWidth(context) * .66,
                child: ElevatedButton(
                    onPressed: () {}, child: const Text('Clock in'))),
            Container(
                padding: const EdgeInsets.all(10),
                width: displayWidth(context) * .66,
                child: ElevatedButton(
                    onPressed: () {}, child: const Text('Unenroll'))),
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
    if (!eventsLoaded) {
      return Scaffold();
    } else {
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
                        'Currently Enrolled',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    const SizedBox(height: 10) /*Spacing for user*/,
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: eventsEnrolled.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: volunteerCard(
                            eventsEnrolled[index].name,
                            eventsEnrolled[index].startDate.toString(),
                            eventsEnrolled[index].description,
                            eventsEnrolled[index].organizer,
                            eventsEnrolled[index].startTime,
                            eventsEnrolled[index].location,
                            eventsEnrolled[index].completed,
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            )),
        /*Naviagtion Bar*/
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
                Navigator.pop(context);
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
                        builder: (context) =>
                            LoginPage(userRepository: UserRepository())));
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
}
