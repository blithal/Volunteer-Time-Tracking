//import 'dart:html';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:volunteer_time_tracking/admin_settings.dart';
import 'package:volunteer_time_tracking/admin_view_admins.dart';
import 'package:volunteer_time_tracking/admin_home.dart';
import 'package:volunteer_time_tracking/admin_view_events.dart';
import 'package:volunteer_time_tracking/admin_view_users.dart';
import 'package:volunteer_time_tracking/bloc_login/login/login_page.dart';
import 'package:volunteer_time_tracking/bloc_login/model/user.dart';
import 'package:volunteer_time_tracking/bloc_login/repository/user_repository.dart';
import 'package:volunteer_time_tracking/models/eventInfo.dart';
import 'package:volunteer_time_tracking/services/remote_service.dart';
import 'package:volunteer_time_tracking/theme/volunteerTheme.dart';
import 'package:volunteer_time_tracking/main.dart';
import 'package:volunteer_time_tracking/admin_account.dart';

class EditEvent extends StatelessWidget {
  EditEvent({Key? key, required this.event, required this.user})
      : super(key: key);
  User user;

  final EventInfo event;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Edit Event Page - Fayetteville Public Library Volunteer System',
      theme: VolunteerTheme.lightTheme,
      home: EditEventPage(
        title: 'Fayetteville Public Library Volunteer System - Edit Event Page',
        event: event,
        user: user,
      ),
    );
  }
}

class EditEventPage extends StatefulWidget {
  EditEventPage(
      {Key? key, required this.event, required this.title, required this.user})
      : super(key: key);

  final EventInfo event;
  final String title;

  User user;
  @override
  State<EditEventPage> createState() => _EditEventPage();
}

class _EditEventPage extends State<EditEventPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final nameController = TextEditingController();
  final descController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final organizerController = TextEditingController();
  final locationController = TextEditingController();

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
  void initState() {
    super.initState();
    loadEditEvent();
  }

  loadEditEvent() {
    if (widget.event.id != -1) {
      nameController.text = widget.event.name;
      descController.text = widget.event.description;
      dateController.text = widget.event.startDate;
      timeController.text = widget.event.startTime;
      organizerController.text = widget.event.organizer;
      locationController.text = widget.event.location;
    }
  }

  _EditEventPressed() async {
    if (widget.event.id != -1) {
      var added = await RemoteService().UpdateEvent(
          widget.event.id,
          nameController.text,
          descController.text,
          DateTime.parse(dateController.text),
          timeController.text,
          widget.event.completed,
          organizerController.text,
          locationController.text);
      if (added) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ViewEvents(
                      user: widget.user,
                    )));
      }
    } else {
      var added = await RemoteService().CreateEvent(
          nameController.text,
          descController.text,
          DateTime.parse(dateController.text),
          timeController.text,
          false,
          organizerController.text,
          locationController.text);
      if (added) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ViewEvents(
                      user: widget.user,
                    )));
      }
    }
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
                      "Previous: " + widget.event.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 10) /*Spacing for user*/,
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: displayWidth(context) * .20,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'New Title',
                      ),
                      controller: nameController,
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
                      "Previous: " + widget.event.startDate.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 10) /*Spacing for user*/,
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: displayWidth(context) * .20,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'New Date',
                      ),
                      controller: dateController,
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
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'New Description',
                      ),
                      controller: descController,
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
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'New Organizer',
                      ),
                      controller: organizerController,
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
                      'Time: ',
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
                      "Previous: " + widget.event.startTime,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 10) /*Spacing for user*/,
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: displayWidth(context) * .20,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'New Time',
                      ),
                      controller: timeController,
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
                      "Previous: " + widget.event.location.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 10) /*Spacing for user*/,
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: displayWidth(context) * .20,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'New Address',
                      ),
                      controller: locationController,
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
                                  builder: (context) => ViewEvents(
                                        user: widget.user,
                                      )));
                        },
                        child: const Text('Cancel'))),
                Container(
                    width: displayWidth(context) * .50,
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                        onPressed: () {
                          _EditEventPressed();
                        },
                        child: const Text('Save'))),
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ViewEvents(
                            user: widget.user,
                          )));
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
