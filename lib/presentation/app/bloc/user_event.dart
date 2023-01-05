part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent([List props = const []]);

  @override
  List<Object> get props => [];
}

class UserReset extends UserEvent {}

class UserFetchOne extends UserEvent {
  final String id;
  UserFetchOne({required this.id}) : super([id]);
}

class UserFetchAll extends UserEvent {}

class UserCreation extends UserEvent {}

class UserCancelCreation extends UserEvent {}

class UserConfirmCreation extends UserEvent {
  final User user;
  UserConfirmCreation({required this.user}) : super([user]);
}

class UserUpdate extends UserEvent {
  final User user;
  UserUpdate({required this.user}) : super([user]);
}

class UserDelete extends UserEvent {
  final User user;
  UserDelete({required this.user}) : super([user]);
}

class UserResetPassword extends UserEvent {
  final String email;
  UserResetPassword({required this.email}) : super([email]);
}
