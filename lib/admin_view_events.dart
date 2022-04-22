import 'dart:html';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:volunteer_time_tracking/admin_edit_event.dart';
import 'package:volunteer_time_tracking/admin_settings.dart';
import 'package:volunteer_time_tracking/admin_view_admins.dart';
import 'package:volunteer_time_tracking/admin_home.dart';
import 'package:volunteer_time_tracking/admin_view_users.dart';
import 'package:volunteer_time_tracking/theme/volunteerTheme.dart';
import 'package:volunteer_time_tracking/main.dart';
import 'package:volunteer_time_tracking/admin_account.dart';

class ViewEvents extends StatelessWidget {
  const ViewEvents({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:
          'Current Events Page - Fayetteville Public Library Volunteer System',
      theme: VolunteerTheme.lightTheme,
      home: const ViewEventsPage(
          title:
              'Fayetteville Public Library Volunteer System - Current Events Page'),
    );
  }
}

class ViewEventsPage extends StatefulWidget {
  const ViewEventsPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ViewEventsPage> createState() => _ViewEventsPage();
}

class Event {
  final String id, event, date, description, organizer, start, end, address;

  const Event(this.id, this.event, this.date, this.description, this.organizer,
      this.start, this.end, this.address);
}

class _ViewEventsPage extends State<ViewEventsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final events = List.generate(
    10,
    (i) => Event(
      '$i',
      'Title $i',
      '$i-1/22',
      'This is a test description for event number $i.',
      'Organizer $i',
      '$i:00am',
      '$i:00am',
      '$i MakeBelieve Place, Fayetteville AR',
    ),
  );

  final nullEvent = List.generate(
    1,
    (i) => const Event(
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
    ),
  );

  Widget volunteerCard(String name, String date, String description,
      String organizerName, String startTime, String endTime, String loca) {
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
                    startTime + "-" + endTime,
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
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
                          builder: (context) => EditEvent(event: nullEvent[0]),
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
              itemCount: events.length,
              itemBuilder: (context, index) {
                return ListTile(
                    title: volunteerCard(
                      events[index].event,
                      events[index].date,
                      events[index].description,
                      events[index].organizer,
                      events[index].start,
                      events[index].end,
                      events[index].address,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditEvent(event: events[index]),
                        ),
                      );
                    });
              },
            )
          ],
        ),
      )),
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AdminHome()));
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ViewUsers()));
            },
            child: const Text('Users'),
          ),
          const SizedBox(height: 10) /*Spacing for user*/,
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 17),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ViewAdmins()));
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
                      builder: (context) => const AdminAccount()));
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
                      builder: (context) => const AdminSettings()));
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
