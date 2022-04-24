import 'dart:html';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:volunteer_time_tracking/admin_settings.dart';
import 'package:volunteer_time_tracking/admin_view_admins.dart';
import 'package:volunteer_time_tracking/admin_home.dart';
import 'package:volunteer_time_tracking/admin_view_events.dart';
import 'package:volunteer_time_tracking/admin_view_users.dart';
import 'package:volunteer_time_tracking/theme/volunteerTheme.dart';
import 'package:volunteer_time_tracking/main.dart';
import 'package:volunteer_time_tracking/admin_account.dart';

class EditEvent extends StatelessWidget {
  const EditEvent({Key? key, required this.event}) : super(key: key);

  final Event event;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Edit Event Page - Fayetteville Public Library Volunteer System',
      theme: VolunteerTheme.lightTheme,
      home: EditEventPage(
        title: 'Fayetteville Public Library Volunteer System - Edit Event Page',
        event: event,
      ),
    );
  }
}

class EditEventPage extends StatefulWidget {
  const EditEventPage({Key? key, required this.event, required this.title})
      : super(key: key);

  final Event event;
  final String title;
  @override
  State<EditEventPage> createState() => _EditEventPage();
}

class _EditEventPage extends State<EditEventPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
        child: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 10) /*Spacing for user*/,
                Container(
                  width: displayWidth(context) * .70,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Edit Event',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                const SizedBox(height: 10) /*Spacing for user*/,
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    width: displayWidth(context) * .20,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Color.fromARGB(255, 126, 148, 203),
                    ),
                    child: const Text(
                      'ID: ',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 10) /*Spacing for user*/,
                  Container(
                    width: displayWidth(context) * .20,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Color.fromARGB(255, 113, 200, 184),
                    ),
                    child: Text(
                      "Previous: " + widget.event.id,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 10) /*Spacing for user*/,
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: displayWidth(context) * .20,
                    child: const TextField(
                      decoration: InputDecoration(
                        labelText: 'New ID',
                      ),
                    ),
                  ),
                ]),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    width: displayWidth(context) * .20,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Color.fromARGB(255, 126, 148, 203),
                    ),
                    child: const Text(
                      'Title: ',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 10) /*Spacing for user*/,
                  Container(
                    width: displayWidth(context) * .20,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Color.fromARGB(255, 113, 200, 184),
                    ),
                    child: Text(
                      "Previous: " + widget.event.event,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 10) /*Spacing for user*/,
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: displayWidth(context) * .20,
                    child: const TextField(
                      decoration: InputDecoration(
                        labelText: 'New Title',
                      ),
                    ),
                  ),
                ]),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    width: displayWidth(context) * .20,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Color.fromARGB(255, 126, 148, 203),
                    ),
                    child: const Text(
                      'Date: ',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 10) /*Spacing for user*/,
                  Container(
                    width: displayWidth(context) * .20,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Color.fromARGB(255, 113, 200, 184),
                    ),
                    child: Text(
                      "Previous: " + widget.event.date,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 10) /*Spacing for user*/,
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: displayWidth(context) * .20,
                    child: const TextField(
                      decoration: InputDecoration(
                        labelText: 'New Date',
                      ),
                    ),
                  ),
                ]),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    width: displayWidth(context) * .20,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Color.fromARGB(255, 126, 148, 203),
                    ),
                    child: const Text(
                      'Description: ',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 10) /*Spacing for user*/,
                  Container(
                    width: displayWidth(context) * .20,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Color.fromARGB(255, 113, 200, 184),
                    ),
                    child: Text(
                      "Previous: " + widget.event.description,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 10) /*Spacing for user*/,
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: displayWidth(context) * .20,
                    child: const TextField(
                      decoration: InputDecoration(
                        labelText: 'New Description',
                      ),
                    ),
                  ),
                ]),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    width: displayWidth(context) * .20,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Color.fromARGB(255, 126, 148, 203),
                    ),
                    child: const Text(
                      'Organizer: ',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 10) /*Spacing for user*/,
                  Container(
                    width: displayWidth(context) * .20,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Color.fromARGB(255, 113, 200, 184),
                    ),
                    child: Text(
                      "Previous: " + widget.event.organizer,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 10) /*Spacing for user*/,
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: displayWidth(context) * .20,
                    child: const TextField(
                      decoration: InputDecoration(
                        labelText: 'New Organizer',
                      ),
                    ),
                  ),
                ]),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    width: displayWidth(context) * .20,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Color.fromARGB(255, 126, 148, 203),
                    ),
                    child: const Text(
                      'Start Time: ',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 10) /*Spacing for user*/,
                  Container(
                    width: displayWidth(context) * .20,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Color.fromARGB(255, 113, 200, 184),
                    ),
                    child: Text(
                      "Previous: " + widget.event.start,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 10) /*Spacing for user*/,
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: displayWidth(context) * .20,
                    child: const TextField(
                      decoration: InputDecoration(
                        labelText: 'New Start Time',
                      ),
                    ),
                  ),
                ]),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    width: displayWidth(context) * .20,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Color.fromARGB(255, 126, 148, 203),
                    ),
                    child: const Text(
                      'End Time: ',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 10) /*Spacing for user*/,
                  Container(
                    width: displayWidth(context) * .20,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Color.fromARGB(255, 113, 200, 184),
                    ),
                    child: Text(
                      "Previous: " + widget.event.end,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 10) /*Spacing for user*/,
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: displayWidth(context) * .20,
                    child: const TextField(
                      decoration: InputDecoration(
                        labelText: 'New EndTime',
                      ),
                    ),
                  ),
                ]),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    width: displayWidth(context) * .20,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Color.fromARGB(255, 126, 148, 203),
                    ),
                    child: const Text(
                      'Address: ',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 10) /*Spacing for user*/,
                  Container(
                    width: displayWidth(context) * .20,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Color.fromARGB(255, 113, 200, 184),
                    ),
                    child: Text(
                      "Previous: " + widget.event.address,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 10) /*Spacing for user*/,
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: displayWidth(context) * .20,
                    child: const TextField(
                      decoration: InputDecoration(
                        labelText: 'New Address',
                      ),
                    ),
                  ),
                ]),
                Container(
                    width: displayWidth(context) * .50,
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ViewEvents()));
                        },
                        child: const Text('Cancel'))),
                Container(
                    width: displayWidth(context) * .50,
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text('Save'))),
              ],
            ),
          ),
        ),
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
