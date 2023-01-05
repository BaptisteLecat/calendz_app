part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent([List props = const []]);

  @override
  List<Object> get props => [];
}

class UserLogInState extends AppEvent {}
