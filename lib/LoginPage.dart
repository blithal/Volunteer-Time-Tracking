import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volunteer_time_tracking/admin_view_events.dart';
import 'package:volunteer_time_tracking/bloc_login/repository/user_repository.dart';

import 'package:volunteer_time_tracking/bloc_login/bloc/authentication_bloc.dart';
import 'package:volunteer_time_tracking/bloc_login/splash/splash.dart';
import 'package:volunteer_time_tracking/bloc_login/login/login_page.dart';
import 'package:volunteer_time_tracking/bloc_login/home/home.dart';
import 'package:volunteer_time_tracking/bloc_login/common/common.dart';
import 'package:volunteer_time_tracking/theme/volunteerTheme.dart';

import 'bloc_login/model/user.dart';

void main() {
  final userRepository = UserRepository();
  final User user = User(id: -1, username: "", token: "");

  runApp(BlocProvider<AuthenticationBloc>(
    create: (context) {
      return AuthenticationBloc(userRepository: userRepository, user: user)
        ..add(AppStarted());
    },
    child: App(user: user, userRepository: userRepository),
  ));
}

class App extends StatelessWidget {
  User user;
  final UserRepository userRepository;

  App({Key? key, required this.userRepository, required this.user})
      : assert(userRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: VolunteerTheme.lightTheme,
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (user.id < 0) {
            state = AuthenticationUnauthenticated();
          }
          if (state is AuthenticationUninitialized) {
            return SplashPage();
          }
          if (state is AuthenticationAuthenticated) {
            return HomePage();
          }
          if (state is AuthenticationUnauthenticated) {
            return LoginPage(
              userRepository: userRepository,
            );
            // return ViewEvents(
            //     user: User(
            //         id: 1,
            //         token: "4fc48e61be704ce90094c79cfd83f04c52bf0f28",
            //         username: "admin"));
          }
          return LoadingIndicator();
        },
      ),
    );
  }
}
