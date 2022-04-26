import 'dart:html';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:volunteer_time_tracking/admin_edit_event.dart';
import 'package:volunteer_time_tracking/admin_settings.dart';
import 'package:volunteer_time_tracking/admin_view_admins.dart';
import 'package:volunteer_time_tracking/admin_home.dart';
import 'package:volunteer_time_tracking/admin_view_users.dart';
import 'package:volunteer_time_tracking/bloc_login/common/common.dart';
import 'package:volunteer_time_tracking/bloc_login/model/user.dart';
import 'package:volunteer_time_tracking/services/remote_service.dart';
import 'package:volunteer_time_tracking/theme/volunteerTheme.dart';
import 'package:volunteer_time_tracking/main.dart';
import 'package:volunteer_time_tracking/admin_account.dart';
import 'package:volunteer_time_tracking/models/eventInfo.dart';

class ViewEvents extends StatelessWidget {
  ViewEvents({Key? key, required this.user}) : super(key: key);
  User user;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:
          'Current Events Page - Fayetteville Public Library Volunteer System',
      theme: VolunteerTheme.lightTheme,
      home: ViewEventsPage(
        title:
            'Fayetteville Public Library Volunteer System - Current Events Page',
        user: user,
      ),
    );
  }
}

class ViewEventsPage extends StatefulWidget {
  ViewEventsPage({Key? key, required this.title, required this.user})
      : super(key: key);

  final String title;
  User user;

  @override
  State<ViewEventsPage> createState() => _ViewEventsPage();
}

// class Event {
//   final String id, event, date, description, organizer, start, end, address;

//   const Event(this.id, this.event, this.date, this.description, this.organizer,
//       this.start, this.end, this.address);
// }

class _ViewEventsPage extends State<ViewEventsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<EventInfo>? events = null;
  bool eventsLoaded = false;

  @override
  void initState() {
    super.initState();
    loadEvents();
  }

  loadEvents() async {
    events = await RemoteService().GetEvents();
    if (events != null) {
      setState(() {
        eventsLoaded = true;
      });
    }
  }

  Widget volunteerCard(String name, String date, String description,
      String organizerName, String startTime, String loca, bool completed) {
    return Container(
        //width: displayWidth(context) * .2,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          color: const Color.fromARGB(255, 100, 105, 111),
          border: Border.all(color: const Color.fromARGB(255, 113, 200, 184)),
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
                  children: <Widget>[
                    const SizedBox(height: 10) /*Spacing for user*/,
                    Container(
                      width: displayWidth(context) * .70,
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        'Current Events',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    const SizedBox(height: 10) /*Spacing for user*/,
                    Container(
                        padding: const EdgeInsets.all(10),
                        width: displayWidth(context) * .5,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditEvent(
                                    event: EventInfo.defaultEvent(),
                                    user: widget.user,
                                  ),
                                ));
                          }, // verify login creditionals (change later)
                          child: const Text(
                            'Create New Event',
                          ),
                        )),
                    const SizedBox(height: 10) /*Spacing for user*/,
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: events?.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                            title: volunteerCard(
                              events![index].name,
                              events![index].startDate.toString(),
                              events![index].description,
                              events![index].organizer,
                              events![index].startTime,
                              events![index].location,
                              events![index].completed,
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditEvent(
                                    event: events![index],
                                    user: widget.user,
                                  ),
                                ),
                              );
                            });
                      },
                    )
                  ],
                ),
              )),
        ),
        /*Page Navagation*/
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
                        builder: (context) => AdminHome(
                              user: widget.user,
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
              child: const Text('Events'),
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
                        builder: (context) => ViewUsers(
                              user: widget.user,
                            )));
              },
              child: const Text('Users'),
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
                        builder: (context) => ViewAdmins(
                              user: widget.user,
                            )));
              },
              child: const Text('Admins'),
            ),
            const SizedBox(height: 10) /*Spacing for user*/,
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 17),
              ),
              onPressed: () {
                /*
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const UserAccount()));
            */
              },
              child: const Text('Reports'),
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
                        builder: (context) => AdminAccount(
                              user: widget.user,
                            )));
              },
              child: const Text('Admin Profile'),
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
                        builder: (context) => AdminSettings(
                              user: widget.user,
                            )));
              },
              child: const Text('Profile Settings'),
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
}
