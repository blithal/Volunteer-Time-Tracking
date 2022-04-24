import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volunteer_time_tracking/bloc_login/model/user.dart';
import 'package:volunteer_time_tracking/bloc_login/permissions/bloc/permission_bloc.dart';
import 'package:volunteer_time_tracking/user_home.dart';
import 'package:volunteer_time_tracking/admin_home.dart';

class PermissionForm extends StatefulWidget {
  final User user;

  PermissionForm({Key? key, required this.user}) : super(key: key);

  @override
  State<PermissionForm> createState() => _PermissionFormState();
}

class _PermissionFormState extends State<PermissionForm> {
  @override
  Widget build(BuildContext context) {
    _checkPermissions() {
      BlocProvider.of<PermissionBloc>(context)
          .add(CheckPermissions(user: widget.user));
    }

    return BlocListener<PermissionBloc, PermissionState>(
      listener: (context, state) {
        if (state is PermissionIsAdmin) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AdminHome(
                    key: widget.key,
                  )));
        }
        if (state is PermissionIsNotAdmin) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => UserHome(
                    user: widget.user,
                    key: widget.key,
                  )));
        }
      },
      child: Container(
          child: ElevatedButton(
              onPressed: _checkPermissions(),
              child: Text("Check Permissions"))),
    );
  }
}
