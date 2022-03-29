import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:volunteer_time_tracking/main.dart';
import 'package:volunteer_time_tracking/user_completed.dart';
import 'package:volunteer_time_tracking/user_enrolled.dart';
import 'package:volunteer_time_tracking/user_registration.dart';
=======
import 'package:volunteer_time_tracking/user.dart';
import 'package:volunteer_time_tracking/services/remote_service.dart';
>>>>>>> f9b1f0413fdfac70c1839e6eb29fef02ff4a93e1

class UserAccount extends StatelessWidget {
  const UserAccount({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Account Page - Fayetteville Public Library Volunteer System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const UserAccountPage(
          title:
              'Fayetteville Public Library Volunteer System - User Account Page'),
    );
  }
}

class UserAccountPage extends StatefulWidget {
  const UserAccountPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<UserAccountPage> createState() => _UserAccountPage();
}

class _UserAccountPage extends State<UserAccountPage> {
  List<User>? users;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    users = await RemoteService().getUsers();
    if (users != null) {
      setState(() {
        isLoaded = true;
      });
    }
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
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Visibility(
        visible: isLoaded,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 10) /*Spacing for user*/,

<<<<<<< HEAD
            /*Display user profile picture and name*/
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              /*Area for profile picture*/
              Container(
                  alignment: Alignment.center,
                  width: 125.0,
                  height: 125.0,
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              "data:image/png;base64,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")))),

              /*Area for name*/
              Container(
                width: displayWidth(context) * .25,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'John Doe',
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ]),
            const SizedBox(height: 10),
=======
              /*Display user profile picture and name*/
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                /*Area for profile picture*/
                Container(
                    width: 125.0,
                    height: 125.0,
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                "data:image/png;base64,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")))),
                /*Spacing for user*/
                Container(
                  width: displayWidth(context) * .25 - 125,
                ),

                /*Area for name*/
                Container(
                  width: displayWidth(context) * .25,
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    users![1].firstName + " " + users![1].lastName,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ]),
              const SizedBox(height: 10),

              /*Display email address for user*/
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                /*Area for print to user*/
                Container(
                  width: displayWidth(context) * .25,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Color.fromARGB(255, 75, 157, 224),
                  ),
                  child: const Text(
                    'Email Address',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                ),
                /*Area to display email*/
                Container(
                  width: displayWidth(context) * .25,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Text(
                    users![1].email,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17),
                  ),
                )
              ]),

              /*Spacing for user*/
              const SizedBox(height: 10),

              /*EXAMPLE: Display phone number of user*/
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                /*Area for print to user*/
                Container(
                  width: displayWidth(context) * .25,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Color.fromARGB(255, 75, 157, 224),
                  ),
                  child: const Text(
                    'Phone Number',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                ),
                /*Area to display phone number*/
                Container(
                  width: displayWidth(context) * .25,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Text(
                    users![1].phone,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17),
                  ),
                )
              ]),

              /*Spacing for user*/
              const SizedBox(height: 10),

              /*EXAMPLE: Display Hours logged of user*/
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                /*Area for print to user*/
                Container(
                  width: displayWidth(context) * .25,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Color.fromARGB(255, 75, 157, 224),
                  ),
                  child: const Text(
                    'Hours Logged',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                ),
                /*Area to display hours logged*/
                Container(
                  width: displayWidth(context) * .25,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: const Text(
                    '-1',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17),
                  ),
                )
              ]),

              /*Button for going to user setting page*/
              Container(
                  padding: const EdgeInsets.all(10),
                  width: displayWidth(context) * .5,
                  child: TextButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                        overlayColor: MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.hovered)) {
                              return Colors.blue.withOpacity(0.04);
                            }

                            if (states.contains(MaterialState.focused) ||
                                states.contains(MaterialState.pressed)) {
                              return Colors.blue.withOpacity(0.12);
                            }
>>>>>>> f9b1f0413fdfac70c1839e6eb29fef02ff4a93e1

                            return null; // Defer to the widget's default.
                          },
                        ),
                      ),
                      onPressed: () {},
                      child: const Text('Edit account details'))),
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
              Navigator.pop(context);
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
