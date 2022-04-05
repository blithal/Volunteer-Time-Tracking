import 'package:flutter/material.dart';
import 'package:volunteer_time_tracking/SignUp.dart';
import 'package:volunteer_time_tracking/user_account.dart';
import 'services/remote_service.dart';
import 'models/user.dart';
import 'models/login_info.dart';
import 'user_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page - Fayetteville Public Library Volunteer System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => Home(),
      // },
      home: const MyHomePage(
          title: 'Fayetteville Public Library Volunteer System - Login'),
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
  List<User>? users;
  List<LoginInfo>? logins;
  bool isLoaded = false;
  bool invalidLogin = false;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  Size displaySize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  double displayHeight(BuildContext context) {
    return displaySize(context).height;
  }

  double displayWidth(BuildContext context) {
    if (displaySize(context).width > 1000) {
      return 1000;
    }
    return displaySize(context).width;
  }

  validateLogin() async {
    logins = await RemoteService().getLogins();
    if (logins != null) {
      logins!.forEach((LoginInfo login) {
        if (login.username == usernameController.text &&
            login.password == passwordController.text) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => UserHome(userId: login.userId)));
        } else {
          setState(() {
            invalidLogin = true;
          });
        }
      });
    }
  }

  // void _showDialog() {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (BuildContext context) {
  //       return new AlertDialog(
  //         title: new Text('Please try again.'),
  //         content: new SingleChildScrollView(
  //           child: new ListBody(
  //             children: [
  //               new Text('Invalid username or password.'),
  //             ],
  //           ),
  //         ),
  //         actions: [
  //           new TextButton(
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //               child: new Text('Ok')),
  //         ],
  //       );
  //     },
  //   );
  // }

  // void _showMainPage() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Login',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              width: displayWidth(context) * .5,
              child: TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              width: displayWidth(context) * .5,
              child: TextField(
                controller: passwordController,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
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

                          return null; // Defer to the widget's default.
                        },
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignUp()),
                      );
                    },
                    child: const Text('Create an account'))),
            Container(
                padding: const EdgeInsets.all(10),
                width: displayWidth(context) * .5,
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 75, 157, 224)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      overlayColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.hovered)) {
                            return const Color.fromARGB(255, 24, 111, 182)
                                .withOpacity(0.04);
                          }

                          if (states.contains(MaterialState.focused) ||
                              states.contains(MaterialState.pressed)) {
                            return const Color.fromARGB(255, 17, 70, 114)
                                .withOpacity(0.12);
                          }

                          return null; // Defer to the widget's default.
                        },
                      ),
                    ),
                    onPressed: () {
                      validateLogin();
                    }, // verify login creditionals (change later)
                    child: const Text('Login'))),
            if (invalidLogin)
              Container(
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Invalid username or password.',
                  style: TextStyle(
                      fontSize: 25, color: Color.fromARGB(255, 17, 70, 114)),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
