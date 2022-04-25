import 'dart:html';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:volunteer_time_tracking/ClockInClockOut.dart';
import 'package:volunteer_time_tracking/UserSettings.dart';
import 'package:volunteer_time_tracking/bloc_login/login/login_page.dart';
import 'package:volunteer_time_tracking/bloc_login/repository/user_repository.dart';
import 'package:volunteer_time_tracking/main.dart';
import 'package:volunteer_time_tracking/theme/volunteerTheme.dart';
import 'package:volunteer_time_tracking/user_account.dart';
import 'package:volunteer_time_tracking/user_completed.dart';
import 'package:volunteer_time_tracking/user_enrolled.dart';
import 'package:volunteer_time_tracking/user_registration.dart';
import 'package:volunteer_time_tracking/bloc_login/model/user.dart';
import 'Event.dart';
import 'services/remote_service.dart';

class UserHome extends StatelessWidget {
  const UserHome({Key? key, required this.user}) : super(key: key);

  final User user;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Home Page - Fayetteville Public Library Volunteer System',
      theme: VolunteerTheme.lightTheme,
      home: UserHomePage(
        title: 'Fayetteville Public Library Volunteer System - User Home Page',
        user: user,
      ),
    );
  }
}

class UserHomePage extends StatefulWidget {
  const UserHomePage({Key? key, required this.title, required this.user})
      : super(key: key);

  final String title;
  final User user;

  @override
  State<UserHomePage> createState() => _UserHomePage();
}

class _UserHomePage extends State<UserHomePage> {
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
      body: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
              padding: const EdgeInsets.all(10),
              child: Visibility(
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
                          'Welcome',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      const SizedBox(height: 10) /*Spacing for user*/,
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            /*Button to Volunteer Opportunites*/
                            Container(
                                width: displayWidth(context) * .30,
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    color: Color.fromARGB(255, 126, 148, 203)),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    IconButton(
                                      iconSize: 50,
                                      color: Colors.white,
                                      icon: const Icon(Icons.assignment),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    UserRegistration(
                                                      currUserId: widget.user,
                                                    )));
                                      },
                                    ),
                                    const Text(
                                      'Volunteer Opportunites',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 17, color: Colors.white),
                                    )
                                  ],
                                )),
                            const SizedBox(width: 20),
                            /*Button to Currently Enrolled Opportunites*/
                            Container(
                                width: displayWidth(context) * .30,
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  color: Color.fromARGB(255, 126, 148, 203),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    IconButton(
                                      iconSize: 50,
                                      color: Colors.white,
                                      icon: const Icon(Icons.assignment_late),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    UserEnrolled(
                                                      currUserId: widget.user,
                                                    )));
                                      },
                                    ),
                                    const Text(
                                      'Currently Enrolled',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 17, color: Colors.white),
                                    )
                                  ],
                                )),
                          ]),
                      const SizedBox(height: 10),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            /*Button to Volunteer History*/
                            Container(
                                width: displayWidth(context) * .30,
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  color: Color.fromARGB(255, 126, 148, 203),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    IconButton(
                                      iconSize: 50,
                                      color: Colors.white,
                                      icon: const Icon(Icons.history),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    UserCompleted(
                                                      currUserId: widget.user,
                                                    )));
                                      },
                                    ),
                                    const Text(
                                      'Volunteer History',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 17, color: Colors.white),
                                    )
                                  ],
                                )),
                            const SizedBox(width: 20),
                            /*Button to Account Page*/
                            Container(
                                width: displayWidth(context) * .30,
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  color: Color.fromARGB(255, 126, 148, 203),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    IconButton(
                                      iconSize: 50,
                                      icon: const Icon(Icons.account_circle),
                                      color: Colors.white,
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    UserAccount(
                                                      user: widget.user,
                                                    )));
                                      },
                                    ),
                                    const Text(
                                      'Account',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 17, color: Colors.white),
                                    )
                                  ],
                                )),
                          ]),
                      const SizedBox(height: 10),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            /*Button to Volunteer History*/
                            Container(
                                width: displayWidth(context) * .62,
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  color: Color.fromARGB(255, 126, 148, 203),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    IconButton(
                                      iconSize: 50,
                                      color: Colors.white,
                                      icon: const Icon(Icons.alarm),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ClockInClockOut(
                                                      user: widget.user,
                                                    )));
                                      },
                                    ),
                                    const Text(
                                      'Clock in',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 17, color: Colors.white),
                                    )
                                  ],
                                )),
                            /*Button to Account Page*/
                          ]),
                      const SizedBox(height: 10),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            /*Button to Account Settings Page*/
                            Container(
                                width: displayWidth(context) * .30,
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  color: Color.fromARGB(255, 126, 148, 203),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    IconButton(
                                      iconSize: 50,
                                      color: Colors.white,
                                      icon: const Icon(Icons.settings),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    UserSettings(
                                                        user: widget.user)));
                                      },
                                    ),
                                    const Text(
                                      'Settings',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 17, color: Colors.white),
                                    )
                                  ],
                                )),
                            const SizedBox(width: 20),
                            /*Button to Sign Out Page*/
                            Container(
                                width: displayWidth(context) * .30,
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  color: Color.fromARGB(255, 126, 148, 203),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    IconButton(
                                      iconSize: 50,
                                      color: Colors.white,
                                      icon: const Icon(Icons.logout),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => LoginPage(
                                                    userRepository:
                                                        UserRepository())));
                                      },
                                    ),
                                    const Text(
                                      'Sign Out',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 17, color: Colors.white),
                                    )
                                  ],
                                )),
                          ])
                    ],
                  ),
                ),
              ))),
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
              Navigator.pop(context);
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
                            currUserId: widget.user,
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
                            currUserId: widget.user,
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
                            currUserId: widget.user,
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
                            user: widget.user,
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
                      builder: (context) => UserSettings(user: widget.user)));
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
