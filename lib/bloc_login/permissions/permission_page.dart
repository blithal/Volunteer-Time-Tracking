import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volunteer_time_tracking/admin_home.dart';
import 'package:volunteer_time_tracking/bloc_login/common/common.dart';
import 'package:volunteer_time_tracking/bloc_login/model/user.dart';
import 'package:volunteer_time_tracking/bloc_login/permissions/bloc/permission_bloc.dart';
import 'package:volunteer_time_tracking/bloc_login/permissions/permission_form.dart';
import 'package:volunteer_time_tracking/user_home.dart';

class PermissionPage extends StatelessWidget {
  final User user;

  PermissionPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var permBloc = PermissionBloc(user: user);
    return MaterialApp(
      // theme: ThemeData(
      //   primarySwatch: Colors.red,
      //   brightness: Brightness.dark,
      // ),
      home: BlocProvider(
          create: (context) {
            return PermissionBloc(user: user);
          },
          child: PermissionForm(
            user: user,
            key: key,
          )),
    );
  }
}
