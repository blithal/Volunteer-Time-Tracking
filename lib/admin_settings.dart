import 'package:flutter/material.dart';
import 'package:volunteer_time_tracking/bloc_login/login/login_page.dart';
import 'package:volunteer_time_tracking/bloc_login/model/user.dart';
import 'package:volunteer_time_tracking/admin_view_events.dart';
import 'package:volunteer_time_tracking/admin_view_users.dart';
import 'package:volunteer_time_tracking/bloc_login/repository/user_repository.dart';
import 'package:volunteer_time_tracking/theme/volunteerTheme.dart';
import 'package:volunteer_time_tracking/main.dart';
import 'package:volunteer_time_tracking/admin_account.dart';
import 'package:volunteer_time_tracking/admin_home.dart';
import 'package:volunteer_time_tracking/admin_view_admins.dart';
import 'package:volunteer_time_tracking/services/remote_service.dart';

class AdminSettings extends StatelessWidget {
  AdminSettings({Key? key, required this.user}) : super(key: key);
  User user;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:
          'Admin Account Settings Page - Fayetteville Public Library Volunteer System',
      theme: VolunteerTheme.lightTheme,
      home: AdminSettingsPage(
          title:
              'Fayetteville Public Library Volunteer System - Admin Account Settings Page',
          user: user),
    );
  }
}

class AdminSettingsPage extends StatefulWidget {
  AdminSettingsPage({Key? key, required this.title, required this.user})
      : super(key: key);
  final String title;
  User user;
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
      body: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Visibility(
              //visible: isLoaded,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: const Text('Settings',
                          style: TextStyle(fontSize: 25)),
                    ),
                    const SizedBox(height: 10),
                    const Text("Password",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 17)),
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
                            onPressed: () {},
                            child: const Text('Change Password'))),
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
