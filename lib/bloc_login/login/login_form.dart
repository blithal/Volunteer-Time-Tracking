// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volunteer_time_tracking/SignUp.dart';
import 'package:volunteer_time_tracking/admin_home.dart';
import 'package:volunteer_time_tracking/bloc_login/login/bloc/login_bloc.dart';
import 'package:volunteer_time_tracking/bloc_login/model/user.dart';
import 'package:volunteer_time_tracking/bloc_login/permissions/permission_page.dart';
import 'package:volunteer_time_tracking/main.dart';
import 'package:volunteer_time_tracking/services/remote_service.dart';
import 'package:volunteer_time_tracking/user_home.dart';

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool admin = false;
    _onLoginButtonPressed() {
      BlocProvider.of<LoginBloc>(context).add(LoginButtonPressed(
          username: _usernameController.text,
          password: _passwordController.text));
    }

    checkIfAdmin(User user) async {
      admin = await RemoteService().isUserAdmin(user);
      if (admin) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AdminHome(
                  user: user,
                )));
      } else {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => UserHome(
                  key: widget.key,
                  user: user,
                )));
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

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('${state.error}'),
            backgroundColor: Colors.red,
          ));
        }
        if (state is LoginSuccess) {
          checkIfAdmin(state.user);
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Align(
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                  padding: const EdgeInsets.all(10),
                  child: Form(
                    child: Padding(
                      padding: EdgeInsets.all(40.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                            child: TextFormField(
                              decoration: InputDecoration(
                                  labelText: 'Username',
                                  icon: Icon(Icons.person)),
                              controller: _usernameController,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            width: displayWidth(context) * .5,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  labelText: 'Password',
                                  icon: Icon(Icons.security)),
                              controller: _passwordController,
                              obscureText: true,
                            ),
                          ),
                          Container(
                              padding: const EdgeInsets.all(10),
                              width: displayWidth(context) * .5,
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const SignUp()),
                                    );
                                  },
                                  child: const Text('Become a volunteer'))),
                          Container(
                            padding: const EdgeInsets.all(10),
                            width: displayWidth(context) * .5,
                            child: ElevatedButton(
                              onPressed: state is! LoginLoading
                                  ? _onLoginButtonPressed
                                  : null,
                              child: Text(
                                'Login',
                              ),
                            ),
                          ),
                          Container(
                            child: state is LoginLoading
                                ? CircularProgressIndicator()
                                : null,
                          ),
                        ],
                      ),
                    ),
                  )));
        },
      ),
    );
  }
}
