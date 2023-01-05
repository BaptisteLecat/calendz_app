part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

// When the user signing in with email and password this event is called and the [AuthRepository] is called to sign in the user
class SignInRequested extends AuthEvent {
  final String email;
  final String password;

  SignInRequested(this.email, this.password);
}

class GoogleSignInRequested extends AuthEvent {
  GoogleSignInRequested();
}

class AppleSignInRequested extends AuthEvent {
  AppleSignInRequested();
}

// When the user signing up with email and password this event is called and the [AuthRepository] is called to sign up the user
class RegisterRequested extends AuthEvent {
  final String email;
  final String password;
  final String firstname;

  RegisterRequested(this.email, this.password, this.firstname);
}

// When the user signing out this event is called and the [AuthRepository] is called to sign out the user
class LogOutRequested extends AuthEvent {}
