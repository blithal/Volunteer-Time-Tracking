import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:volunteer_time_tracking/bloc_login/model/user.dart';
import 'package:volunteer_time_tracking/services/remote_service.dart';

part 'permission_event.dart';
part 'permission_state.dart';

class PermissionBloc extends Bloc<PermissionEvent, PermissionState> {
  final User user;

  PermissionBloc({required this.user}) : super(PermissionInitial()) {
    on<PermissionEvent>((event, emit) async {
      if (event is CheckPermissions) {
        try {
          final isAdmin = await RemoteService().isUserAdmin(user);
          if (isAdmin) {
            emit(PermissionIsAdmin(user: user));
          } else {
            emit(PermissionIsNotAdmin(user: user));
          }
        } catch (error) {
          emit(PermissionCheckFail(error: error.toString()));
        }
      }
    });
  }
}
