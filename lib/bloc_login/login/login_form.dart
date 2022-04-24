// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => AdminHome()));
      } else {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => UserHome(
                  key: widget.key,
                  user: user,
                )));
      }
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
          return Container(
            child: Form(
              child: Padding(
                padding: EdgeInsets.all(40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'username', icon: Icon(Icons.person)),
                      controller: _usernameController,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'password', icon: Icon(Icons.security)),
                      controller: _passwordController,
                      obscureText: true,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: MediaQuery.of(context).size.width * 0.22,
                      child: Padding(
                        padding: EdgeInsets.only(top: 30.0),
                        child: ElevatedButton(
                          onPressed: state is! LoginLoading
                              ? _onLoginButtonPressed
                              : null,
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 24.0,
                            ),
                          ),
                          // shape: StadiumBorder(
                          //   side: BorderSide(
                          //     color: Colors.black,
                          //     width: 2,
                          //   ),
                          // ),
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
            ),
          );
        },
      ),
    );
  }
}
