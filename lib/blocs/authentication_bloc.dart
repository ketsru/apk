import 'package:flutter_bloc/flutter_bloc.dart';
import '../repositories/user_repository.dart';
import '../models/user.dart';

abstract class AuthenticationEvent {}

class LoginButtonPressed extends AuthenticationEvent {
  final String email;
  final String password;

  LoginButtonPressed({required this.email, required this.password});
}

abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {
  final User user;

  AuthenticationAuthenticated({required this.user});
}

class AuthenticationUnauthenticated extends AuthenticationState {}

class AuthenticationFailure extends AuthenticationState {
  final String error;

  AuthenticationFailure({required this.error});
}

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;

  AuthenticationBloc({required this.userRepository}) : super(AuthenticationInitial());

  //@override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async* {
    if (event is LoginButtonPressed) {
      yield AuthenticationLoading();
      try {
        final user = await userRepository.login(event.email, event.password);
        yield AuthenticationAuthenticated(user: user);
      } catch (error) {
        yield AuthenticationFailure(error: error.toString());
      }
    }
  }
}
