import 'dart:html';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:volunteer_time_tracking/ClockInClockOut.dart';
import 'package:volunteer_time_tracking/UserSettings.dart';
import 'package:volunteer_time_tracking/main.dart';
import 'package:volunteer_time_tracking/user_account.dart';
import 'package:volunteer_time_tracking/user_completed.dart';
import 'package:volunteer_time_tracking/user_enrolled.dart';
import 'package:volunteer_time_tracking/user_registration.dart';
import 'package:volunteer_time_tracking/models/user.dart';
import 'Event.dart';
import 'services/remote_service.dart';

class UserHome extends StatelessWidget {
  const UserHome({Key? key, required this.userId}) : super(key: key);

  final String userId;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Home Page - Fayetteville Public Library Volunteer System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserHomePage(
        title: 'Fayetteville Public Library Volunteer System - User Home Page',
        currUserId: userId,
      ),
    );
  }
}

class UserHomePage extends StatefulWidget {
  const UserHomePage({Key? key, required this.title, required this.currUserId})
      : super(key: key);

  final String title;
  final String currUserId;

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
      body: Visibility(
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
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                /*Button to Volunteer Opportunites*/
                Container(
                    width: displayWidth(context) * .30,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Color.fromARGB(255, 75, 157, 224),
                    ),
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
                                    builder: (context) => UserRegistration(
                                          currUserId: widget.currUserId,
                                        )));
                          },
                        ),
                        const Text(
                          'Volunteer Opportunites',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        )
                      ],
                    )),
                const SizedBox(width: 20),
                /*Button to Currently Enrolled Opportunites*/
                Container(
                    width: displayWidth(context) * .30,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Color.fromARGB(255, 75, 157, 224),
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
                                    builder: (context) => UserEnrolled(
                                          currUserId: widget.currUserId,
                                        )));
                          },
                        ),
                        const Text(
                          'Currently Enrolled',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        )
                      ],
                    )),
              ]),
              const SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                /*Button to Volunteer History*/
                Container(
                    width: displayWidth(context) * .30,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Color.fromARGB(255, 75, 157, 224),
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
                                    builder: (context) => UserCompleted(
                                          currUserId: widget.currUserId,
                                        )));
                          },
                        ),
                        const Text(
                          'Volunteer History',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        )
                      ],
                    )),
                const SizedBox(width: 20),
                /*Button to Account Page*/
                Container(
                    width: displayWidth(context) * .30,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Color.fromARGB(255, 75, 157, 224),
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
                                    builder: (context) => UserAccount(
                                          currUserId: widget.currUserId,
                                        )));
                          },
                        ),
                        const Text(
                          'Account',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        )
                      ],
                    )),
              ]),
              const SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                /*Button to Volunteer History*/
                Container(
                    width: displayWidth(context) * .30,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Color.fromARGB(255, 75, 157, 224),
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
                                    builder: (context) => ClockInClockOut(
                                          currUserId: widget.currUserId,
                                        )));
                          },
                        ),
                        const Text(
                          'Clock in',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        )
                      ],
                    )),
                const SizedBox(width: 20),
                /*Button to Account Page*/
                Container(
                    width: displayWidth(context) * .30,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Color.fromARGB(255, 75, 157, 224),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          iconSize: 50,
                          icon: const Icon(Icons.circle),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Event(
                                          currUserId: widget.currUserId,
                                        )));
                          },
                        ),
                        const Text(
                          'Example',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        )
                      ],
                    )),
              ]),
              const SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                /*Button to Account Settings Page*/
                Container(
                    width: displayWidth(context) * .30,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Color.fromARGB(255, 75, 157, 224),
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
                                    builder: (context) => UserSettings(
                                          currUserId: widget.currUserId,
                                        )));
                          },
                        ),
                        const Text(
                          'Settings',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        )
                      ],
                    )),
                const SizedBox(width: 20),
                /*Button to Sign Out Page*/
                Container(
                    width: displayWidth(context) * .30,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Color.fromARGB(255, 75, 157, 224),
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
                                    builder: (context) => const MyApp()));
                          },
                        ),
                        const Text(
                          'Sign Out',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        )
                      ],
                    )),
              ])
            ],
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
                            currUserId: widget.currUserId,
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
            onPressed: () {},
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
