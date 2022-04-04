import 'dart:html';
import 'package:flutter/material.dart';
import 'package:volunteer_time_tracking/main.dart';
import 'package:volunteer_time_tracking/user_account.dart';
import 'package:volunteer_time_tracking/user_completed.dart';
import 'package:volunteer_time_tracking/user_enrolled.dart';
import 'package:volunteer_time_tracking/user_registration.dart';

class UserHome extends StatelessWidget {
  const UserHome({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Home Page - Fayetteville Public Library Volunteer System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const UserHomePage(
          title:
              'Fayetteville Public Library Volunteer System - User Home Page'),
    );
  }
}

class UserHomePage extends StatefulWidget {
  const UserHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

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
                                    builder: (context) =>
                                        const UserRegistration()));
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
                                    builder: (context) =>
                                        const UserEnrolled()));
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
                                    builder: (context) =>
                                        const UserCompleted()));
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
                                    builder: (context) => const UserAccount()));
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
                                    builder: (context) =>
                                        const UserCompleted()));
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
                                    builder: (context) => const UserAccount()));
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
                          onPressed: () {},
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const UserAccount()));
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
