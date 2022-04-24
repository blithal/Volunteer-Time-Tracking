part of 'permission_bloc.dart';

@immutable
abstract class PermissionState extends Equatable {
  const PermissionState();

  @override
  List<Object> get props => [];
}

class PermissionInitial extends PermissionState {}

class PermissionIsAdmin extends PermissionState {
  final User user;

  const PermissionIsAdmin({required this.user});

  @override
  List<Object> get props => [user];
}

class PermissionIsNotAdmin extends PermissionState {
  final User user;

  const PermissionIsNotAdmin({required this.user});

  @override
  List<Object> get props => [user];
}

class PermissionCheckFail extends PermissionState {
  final String error;

  const PermissionCheckFail({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => ' PermissionCheckFail { error: $error }';
}
