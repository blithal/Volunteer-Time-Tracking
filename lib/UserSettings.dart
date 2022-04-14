import 'package:flutter/material.dart';
import 'package:volunteer_time_tracking/theme/volunteerTheme.dart';
import 'package:volunteer_time_tracking/main.dart';
import 'package:volunteer_time_tracking/user_account.dart';
import 'package:volunteer_time_tracking/user_completed.dart';
import 'package:volunteer_time_tracking/user_enrolled.dart';
import 'package:volunteer_time_tracking/user_home.dart';
import 'package:volunteer_time_tracking/user_registration.dart';
import 'package:volunteer_time_tracking/user_account.dart';
import 'package:volunteer_time_tracking/user.dart';
import 'package:volunteer_time_tracking/services/remote_service.dart';

class UserSettings extends StatelessWidget {
  const UserSettings({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:
          'User Account Settings Page - Fayetteville Public Library Volunteer System',
      theme: VolunteerTheme.lightTheme,
      home: const MyHomePage(
          title:
              'Fayetteville Public Library Volunteer System - User Account Settings Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
              Container(
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Receieve Notifications',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 17),
                ),
              ),
              SizedBox(width: displayWidth(context) * .02),
              Container(
                  padding: const EdgeInsets.all(10),
                  child: const MyStatefulCheckbox()),
              const Text("Password",
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 17)),
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
                textAlign: TextAlign.center,
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
                textAlign: TextAlign.center,
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
                  MaterialPageRoute(builder: (context) => const UserHome()));
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
                      builder: (context) => const UserRegistration()));
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
                      builder: (context) => const UserEnrolled()));
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
                      builder: (context) => const UserCompleted()));
            },
            child: const Text('Volunteer History'),
          ),
          const SizedBox(height: 25) /*Spacing for user*/,
          TextButton.icon(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 17),
            ),
            onPressed: () {
              MaterialPageRoute(builder: (context) => const UserAccount());
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
              Navigator.pop(context);
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
