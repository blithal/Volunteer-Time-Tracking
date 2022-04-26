import 'dart:io';
//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:volunteer_time_tracking/SignUp.dart';
import 'package:volunteer_time_tracking/bloc_login/login/bloc/login_bloc.dart';
import 'package:volunteer_time_tracking/user_account.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc_login/bloc/authentication_bloc.dart';
import 'bloc_login/model/user.dart';
import 'bloc_login/repository/user_repository.dart';
import 'services/remote_service.dart';
import 'models/userInfo.dart';
import 'models/login_info.dart';
import 'user_home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:volunteer_time_tracking/theme/volunteerTheme.dart';
import 'package:volunteer_time_tracking/user_home.dart';
import 'package:volunteer_time_tracking/admin_home.dart';

void main() {
  final userRepository = UserRepository();
  final User user = User(id: -1, username: "", token: "");
  // runApp(const MyApp());
  runApp(BlocProvider<AuthenticationBloc>(
    create: (context) {
      return AuthenticationBloc(userRepository: userRepository, user: user)
        ..add(AppStarted());
    },
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: new MediaQueryData(),
      child: MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                title: Text(
                    'Login Page - Fayetteville Public Library Volunteer System')),
            body: BlocProvider(
                create: (context) {
                  return LoginBloc(
                    userRepository: new UserRepository(),
                    authenticationBloc:
                        BlocProvider.of<AuthenticationBloc>(context),
                  );
                },
                child: MyHomePage(
                  title: "Login Page",
                ))
            //home: const MyHomePage(title: 'Volunteer System Login'),
            ),
      ),
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
  List<UserInfo>? users;
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

  @override
  Widget build(BuildContext context) {
    _onLoginButtonPressed() {
      BlocProvider.of<LoginBloc>(context).add(LoginButtonPressed(
          username: usernameController.text,
          password: passwordController.text));
    }

    return BlocListener<LoginBloc, LoginState>(listener: (context, state) {
      if (state is LoginFailure) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('${state.error}'),
          backgroundColor: Colors.red,
        ));
      }
      if (state is LoginSuccess) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => UserHome(user: state.user, key: widget.key)));
      }
    }, child: BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                // children: [
                //   const Image(image: AssetImage('graphics/library_logo_name.png')),
                //   Text(widget.title,
                //       style: GoogleFonts.mulish(
                //           textStyle: const TextStyle(
                //               fontSize: 25,
                //               color: Color.fromARGB(255, 100, 105, 111)))),
                // ],
                ),
            backgroundColor: Colors.blue,
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
                      color: Color.fromARGB(255, 100, 105, 111),
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
                          overlayColor:
                              MaterialStateProperty.resolveWith<Color?>(
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
                            MaterialPageRoute(
                                builder: (context) => const SignUp()),
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
                          overlayColor:
                              MaterialStateProperty.resolveWith<Color?>(
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
                        onPressed: state is! LoginLoading
                            ? _onLoginButtonPressed()
                            : null,
                        child: const Text('Login'))),
                if (invalidLogin)
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Invalid username or password.',
                      style: TextStyle(
                          fontSize: 25,
                          color: Color.fromARGB(255, 17, 70, 114)),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    ));
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Row(
    //         // mainAxisAlignment: MainAxisAlignment.start,
    //         // children: [
    //         //   const Image(image: AssetImage('graphics/library_logo_name.png')),
    //         //   Text(widget.title,
    //         //       style: GoogleFonts.mulish(
    //         //           textStyle: const TextStyle(
    //         //               fontSize: 25,
    //         //               color: Color.fromARGB(255, 100, 105, 111)))),
    //         // ],
    //         ),
    //     backgroundColor: Colors.blue,
    //   ),
    //   body: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       children: <Widget>[
    //         Container(
    //           padding: const EdgeInsets.all(10),
    //           child: const Text(
    //             'Login',
    //             style: TextStyle(
    //               fontSize: 25,
    //               color: Color.fromARGB(255, 100, 105, 111),
    //             ),
    //           ),
    //         ),
    //         Container(
    //           padding: const EdgeInsets.all(10),
    //           width: displayWidth(context) * .5,
    //           child: TextField(
    //             controller: usernameController,
    //             decoration: const InputDecoration(
    //               border: OutlineInputBorder(),
    //               labelText: 'Username',
    //             ),
    //           ),
    //         ),
    //         Container(
    //           padding: const EdgeInsets.all(10),
    //           width: displayWidth(context) * .5,
    //           child: TextField(
    //             controller: passwordController,
    //             obscureText: true,
    //             enableSuggestions: false,
    //             autocorrect: false,
    //             decoration: const InputDecoration(
    //               border: OutlineInputBorder(),
    //               labelText: 'Password',
    //             ),
    //           ),
    //         ),
    //         Container(
    //             padding: const EdgeInsets.all(10),
    //             width: displayWidth(context) * .5,
    //             child: TextButton(
    //                 style: ButtonStyle(
    //                   foregroundColor:
    //                       MaterialStateProperty.all<Color>(Colors.blue),
    //                   overlayColor: MaterialStateProperty.resolveWith<Color?>(
    //                     (Set<MaterialState> states) {
    //                       if (states.contains(MaterialState.hovered)) {
    //                         return Colors.blue.withOpacity(0.04);
    //                       }

    //                       if (states.contains(MaterialState.focused) ||
    //                           states.contains(MaterialState.pressed)) {
    //                         return Colors.blue.withOpacity(0.12);
    //                       }

    //                       return null; // Defer to the widget's default.
    //                     },
    //                   ),
    //                 ),
    //                 onPressed: () {
    //                   Navigator.push(
    //                     context,
    //                     MaterialPageRoute(builder: (context) => const SignUp()),
    //                   );
    //                 },
    //                 child: const Text('Create an account'))),
    //         Container(
    //             padding: const EdgeInsets.all(10),
    //             width: displayWidth(context) * .5,
    //             child: ElevatedButton(
    //                 style: ButtonStyle(
    //                   backgroundColor: MaterialStateProperty.all<Color>(
    //                       const Color.fromARGB(255, 75, 157, 224)),
    //                   foregroundColor:
    //                       MaterialStateProperty.all<Color>(Colors.white),
    //                   overlayColor: MaterialStateProperty.resolveWith<Color?>(
    //                     (Set<MaterialState> states) {
    //                       if (states.contains(MaterialState.hovered)) {
    //                         return const Color.fromARGB(255, 24, 111, 182)
    //                             .withOpacity(0.04);
    //                       }

    //                       if (states.contains(MaterialState.focused) ||
    //                           states.contains(MaterialState.pressed)) {
    //                         return const Color.fromARGB(255, 17, 70, 114)
    //                             .withOpacity(0.12);
    //                       }

    //                       return null; // Defer to the widget's default.
    //                     },
    //                   ),
    //                 ),
    //                 onPressed: () {
    //                   validateLogin();
    //                 }, // verify login creditionals (change later)
    //                 child: const Text('Login'))),
    //         if (invalidLogin)
    //           Container(
    //             padding: const EdgeInsets.all(10),
    //             child: const Text(
    //               'Invalid username or password.',
    //               style: TextStyle(
    //                   fontSize: 25, color: Color.fromARGB(255, 17, 70, 114)),
    //             ),
    //           ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
