part of 'user_bloc.dart';

enum UserStatus {
  initial,
  success,
  failure,
  inProgress,
  select,
  creation,
  cancelCreation,
  confirmCreation,
  created,
  deleted,
  updated,
  resetPassword,
  emailNotFound,
  passwordReseted,
}

extension UserStatusX on UserStatus {
  bool get initial => this == UserStatus.initial;
  bool get success => this == UserStatus.success;
  bool get failure => this == UserStatus.failure;
  bool get inProgress => this == UserStatus.inProgress;
  bool get select => this == UserStatus.select;
  bool get creation => this == UserStatus.creation;
  bool get cancelCreation => this == UserStatus.cancelCreation;
  bool get confirmCreation => this == UserStatus.confirmCreation;
  bool get created => this == UserStatus.created;
  bool get deleted => this == UserStatus.deleted;
  bool get updated => this == UserStatus.updated;
  bool get resetPassword => this == UserStatus.resetPassword;
  bool get emailNotFound => this != UserStatus.emailNotFound;
  bool get passwordReseted => this == UserStatus.passwordReseted;
}

class UserState extends Equatable {
  const UserState(
      {this.status = UserStatus.initial,
      this.message = '',
      List<User>? users,
      User? user})
      : users = users ?? const [],
        user = user ?? User.empty;

  final UserStatus status;
  final String message;
  final List<User> users;
  final User user;

  @override
  List<Object> get props => [status, message];

  UserState copyWith(
      {UserStatus? status, String? message, List<User>? users, User? user}) {
    return UserState(
      status: status ?? this.status,
      message: message ?? this.message,
      users: users ?? this.users,
      user: user ?? this.user,
    );
  }
}
