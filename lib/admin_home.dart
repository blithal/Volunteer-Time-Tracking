import 'dart:html';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:volunteer_time_tracking/admin_settings.dart';
import 'package:volunteer_time_tracking/admin_view_admins.dart';
import 'package:volunteer_time_tracking/theme/volunteerTheme.dart';
import 'package:volunteer_time_tracking/main.dart';
import 'package:volunteer_time_tracking/admin_account.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin Home Page - Fayetteville Public Library Volunteer System',
      theme: VolunteerTheme.lightTheme,
      home: const AdminHomePage(
          title:
              'Fayetteville Public Library Volunteer System - Admin Home Page'),
    );
  }
}

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AdminHomePage> createState() => _AdminHomePage();
}

class _AdminHomePage extends State<AdminHomePage> {
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
                  'Welcome Admin',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25),
                ),
              ),
              const SizedBox(height: 10) /*Spacing for user*/,
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                /*Button to Volunteer History*/
                Container(
                    width: displayWidth(context) * .30,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Color.fromARGB(255, 126, 148, 203),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          iconSize: 50,
                          color: Colors.white,
                          icon: const Icon(Icons.event),
                          onPressed: () {
                            /*Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const UserCompleted()));
                          */
                          },
                        ),
                        const Text(
                          'View Events',
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
                      color: Color.fromARGB(255, 126, 148, 203),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          iconSize: 50,
                          icon: const Icon(Icons.event_note),
                          color: Colors.white,
                          onPressed: () {
                            /*
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const UserAccount()));
                          */
                          },
                        ),
                        const Text(
                          'Edit Events',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        )
                      ],
                    )),
              ]),
              const SizedBox(height: 10) /*Spacing for user*/,
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                /*Button to Volunteer History*/
                Container(
                    width: displayWidth(context) * .30,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Color.fromARGB(255, 126, 148, 203),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          iconSize: 50,
                          color: Colors.white,
                          icon: const Icon(Icons.create),
                          onPressed: () {
                            /*
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const UserCompleted()));
                          */
                          },
                        ),
                        const Text(
                          'Create Report',
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
                      color: Color.fromARGB(255, 126, 148, 203),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          iconSize: 50,
                          icon: const Icon(Icons.report),
                          color: Colors.white,
                          onPressed: () {
                            /*
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const UserAccount()));
                          */
                          },
                        ),
                        const Text(
                          'View Reports',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        )
                      ],
                    )),
              ]),
              const SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                /*Button to Volunteer Opportunites*/
                Container(
                    width: displayWidth(context) * .30,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Color.fromARGB(255, 126, 148, 203)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          iconSize: 50,
                          color: Colors.white,
                          icon: const Icon(Icons.accessibility),
                          onPressed: () {
                            /*
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const UserRegistration()));
                          */
                          },
                        ),
                        const Text(
                          'View Users',
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
                      color: Color.fromARGB(255, 126, 148, 203),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          iconSize: 50,
                          color: Colors.white,
                          icon: const Icon(Icons.account_circle),
                          onPressed: () {
                            /*
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const UserEnrolled()));
                          */
                          },
                        ),
                        const Text(
                          'Edit Users',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        )
                      ],
                    )),
              ]),
              const SizedBox(height: 10) /*Spacing for user*/,
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                /*Button to Account Settings Page*/
                Container(
                    width: displayWidth(context) * .30,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Color.fromARGB(255, 126, 148, 203),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          iconSize: 50,
                          color: Colors.white,
                          icon: const Icon(Icons.people_alt),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ViewAdmins()));
                          },
                        ),
                        const Text(
                          'Veiw Admins',
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
                      color: Color.fromARGB(255, 126, 148, 203),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          iconSize: 50,
                          color: Colors.white,
                          icon: const Icon(Icons.perm_identity),
                          onPressed: () {
                            /*
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MyApp()));
                          */
                          },
                        ),
                        const Text(
                          'Edit Admins',
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
                      color: Color.fromARGB(255, 126, 148, 203),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          iconSize: 50,
                          color: Colors.white,
                          icon: const Icon(Icons.badge),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const AdminAccount()));
                          },
                        ),
                        const Text(
                          'Admin Profile',
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
                                        const AdminSettings()));
                          },
                        ),
                        const Text(
                          'Profile Settings',
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
                    width: displayWidth(context) * .62,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
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
                                    builder: (context) => const MyApp()));
                          },
                        ),
                        const Text(
                          'Logout',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        )
                      ],
                    )),
                /*Button to Account Page*/
              ]),
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
