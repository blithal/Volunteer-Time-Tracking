part of 'permission_bloc.dart';

@immutable
abstract class PermissionEvent extends Equatable {
  const PermissionEvent();
}

class CheckPermissions extends PermissionEvent {
  final User user;

  const CheckPermissions({required this.user});

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'CheckPermissions { user: $user }';
}
