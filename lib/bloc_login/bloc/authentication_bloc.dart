import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:volunteer_time_tracking/bloc_login/repository/user_repository.dart';
import 'package:volunteer_time_tracking/bloc_login/model/user.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;
  final User user;

  AuthenticationBloc({required this.userRepository, required this.user})
      : assert(UserRepository != null),
        super(AuthenticationUnauthenticated()) {
    on<AuthenticationEvent>((event, emit) async {
      if (event is AppStarted) {
        // final bool hasToken = await userRepository.hasToken();

        // if (hasToken) {
        //   emit(AuthenticationAuthenticated());
        // } else {
        //   emit(AuthenticationUnauthenticated());
        // }
        emit(AuthenticationAuthenticated());
      }

      if (event is LoggedIn) {
        // emit(AuthenticationLoading());

        // await userRepository.persistToken(user: event.user);
        //TODO: write token to database

        emit(AuthenticationAuthenticated());
      }

      if (event is LoggedOut) {
        // emit(AuthenticationLoading());

        // await userRepository.deleteToken(id: 0);

        emit(AuthenticationUnauthenticated());
      }
    });
  }

  // @override
  // Stream<AuthenticationState> mapEventToState(
  //   AuthenticationEvent event,
  // ) async* {
  //   if (event is AppStarted) {
  //     final bool hasToken = await userRepository.hasToken();

  //     if (hasToken) {
  //       yield AuthenticationAuthenticated();
  //     } else {
  //       yield AuthenticationUnauthenticated();
  //     }
  //   }

  //   if (event is LoggedIn) {
  //     yield AuthenticationLoading();

  //     await userRepository.persistToken(user: event.user);

  //     yield AuthenticationAuthenticated();
  //   }

  //   if (event is LoggedOut) {
  //     yield AuthenticationLoading();

  //     await userRepository.deleteToken(id: 0);

  //     yield AuthenticationUnauthenticated();
  //   }
  // }
}
