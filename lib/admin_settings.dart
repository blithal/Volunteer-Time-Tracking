import 'package:flutter/material.dart';
import 'package:volunteer_time_tracking/theme/volunteerTheme.dart';
import 'package:volunteer_time_tracking/main.dart';
import 'package:volunteer_time_tracking/admin_account.dart';
import 'package:volunteer_time_tracking/admin_home.dart';
import 'package:volunteer_time_tracking/admin_view_admins.dart';
import 'package:volunteer_time_tracking/user.dart';
import 'package:volunteer_time_tracking/services/remote_service.dart';

class AdminSettings extends StatelessWidget {
  const AdminSettings({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:
          'Admin Account Settings Page - Fayetteville Public Library Volunteer System',
      theme: VolunteerTheme.lightTheme,
      home: const AdminSettingsPage(
          title:
              'Fayetteville Public Library Volunteer System - Admin Account Settings Page'),
    );
  }
}

class AdminSettingsPage extends StatefulWidget {
  const AdminSettingsPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<AdminSettingsPage> createState() => _AdminSettingsState();
}

class _AdminSettingsState extends State<AdminSettingsPage> {
  @override
  Widget build(BuildContext context) {
    bool notificationsEnabled = false;

    onPasswordChangeButtonPressed() {
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

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Visibility(
        //visible: isLoaded,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(10),
                child: const Text('Settings', style: TextStyle(fontSize: 25)),
              ),
              const SizedBox(height: 10),
              const Text("Password",
                  textAlign: TextAlign.left, style: TextStyle(fontSize: 17)),
              Container(
                padding: const EdgeInsets.all(10),
                width: displayWidth(context) * .5,
                child: const TextField(
                  decoration: InputDecoration(
                    labelText: 'Old Password',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                width: displayWidth(context) * .5,
                child: const TextField(
                  decoration: InputDecoration(
                    labelText: 'New Password',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                width: displayWidth(context) * .5,
                child: const TextField(
                  decoration: InputDecoration(
                    labelText: 'Confirm New Password',
                  ),
                ),
              ),
              Container(
                  padding: const EdgeInsets.all(10),
                  width: displayWidth(context) * .5,
                  child: TextButton(
                      onPressed: () {}, child: const Text('Change Password'))),
              const Text(
                "Email",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 17),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                width: displayWidth(context) * .5,
                child: const TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                ),
              ),
              Container(
                  padding: const EdgeInsets.all(10),
                  width: displayWidth(context) * .5,
                  child: TextButton(
                      onPressed: () {}, child: const Text('Save Email'))),
              const Text(
                "Phone Number",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 17),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                width: displayWidth(context) * .5,
                child: const TextField(
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                  ),
                ),
              ),
              Container(
                  padding: const EdgeInsets.all(10),
                  width: displayWidth(context) * .5,
                  child: TextButton(
                      onPressed: () {},
                      child: const Text('Save Phone Number'))),
              Container(
                  padding: const EdgeInsets.all(10),
                  width: displayWidth(context) * .5,
                  child: TextButton(
                      onPressed: () {}, child: const Text('Save All'))),
            ],
          ),
        ),
        replacement: const Center(child: CircularProgressIndicator()),
      ),
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
              /*
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const UserRegistration()));
            */
            },
            child: const Text('View Events'),
          ),
          const SizedBox(height: 10) /*Spacing for user*/,
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 17),
            ),
            onPressed: () {
              /*
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const UserEnrolled()));
            */
            },
            child: const Text('Edit Events'),
          ),
          const SizedBox(height: 10) /*Spacing for user*/,
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 17),
            ),
            onPressed: () {
              /*
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const UserCompleted()));
            */
            },
            child: const Text('Create Report'),
          ),
          const SizedBox(height: 10) /*Spacing for user*/,
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 17),
            ),
            onPressed: () {
              /*
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AdminAccount()));
            */
            },
            child: const Text('View Reports'),
          ),
          const SizedBox(height: 10) /*Spacing for user*/,
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 17),
            ),
            onPressed: () {
              /*
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const UserSettings()));
            */
            },
            child: const Text('View Users'),
          ),
          const SizedBox(height: 10) /*Spacing for user*/,
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 17),
            ),
            onPressed: () {
              /*
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const UserRegistration()));
            */
            },
            child: const Text('Edit Users'),
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
            child: const Text('View Admins'),
          ),
          const SizedBox(height: 10) /*Spacing for user*/,
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 17),
            ),
            onPressed: () {
              /*
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const UserRegistration()));
            */
            },
            child: const Text('Edit Admins'),
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
              Navigator.pop(context);
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

// checkbox
class MyStatefulCheckbox extends StatefulWidget {
  const MyStatefulCheckbox({Key? key}) : super(key: key);

  @override
  State<MyStatefulCheckbox> createState() => _MyStatefulCheckboxState();
}

class _MyStatefulCheckboxState extends State<MyStatefulCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
