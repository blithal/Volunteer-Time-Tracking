import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:volunteer_time_tracking/bloc_login/bloc/authentication_bloc.dart';
import 'package:volunteer_time_tracking/bloc_login/repository/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:volunteer_time_tracking/bloc_login/model/user.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({required this.userRepository, required this.authenticationBloc})
      : assert(userRepository != null),
        assert(authenticationBloc != null),
        super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is LoginButtonPressed) {
        // emit(LoginInitial());

        try {
          final user = await userRepository.authenticate(
              username: event.username, password: event.password);
          authenticationBloc.add(LoggedIn(user: user));
          emit(LoginSuccess(user: user));
        } catch (error) {
          emit(LoginFailure(error: error.toString()));
        }
      }
    });
  }

  // Stream<LoginState> mapEventToState(
  //   LoginEvent event,
  // ) async* {
  //   if (event is LoginButtonPressed) {
  //     yield LoginInitial();

  //     try {
  //       final user = await userRepository.authenticate(
  //           username: event.username, password: event.password);
  //       authenticationBloc.add(LoggedIn(user: user));
  //       yield LoginInitial();
  //     } catch (error) {
  //       yield LoginFailure(error: error.toString());
  //     }
  //   }
  // }
}
