import 'package:bloc/bloc.dart';
import 'package:calendz_app/services/auth/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:calendz_app/common/error/app_exception.dart';
import 'package:calendz_app/domain/entity/user/user.dart';
import 'package:calendz_app/domain/repository/user_repository/user_repository.dart';
import 'package:equatable/equatable.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserRepository _userRepository = UserRepository();
  AuthService _firebaseAuthRepository = AuthService();
  UserBloc() : super(const UserState()) {
    on<UserReset>(_onReset);
    on<UserFetchOne>(_onFetchOne);
    on<UserFetchAll>(_onFetchAll);
    on<UserCreation>(_onCreateUser);
    on<UserCancelCreation>(_onCancelCreation);
    on<UserConfirmCreation>(_onConfirmCreation);
    on<UserUpdate>(_onUpdate);
    on<UserDelete>(_onDelete);
    on<UserResetPassword>(_onResetPassword);
  }

  _onFetchOne(
    UserFetchOne event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(
      status: UserStatus.inProgress,
      message: '',
      user: User.empty,
      users: const [],
    ));
    try {
      await _userRepository.getOne(docId: event.id).then((value) {
        emit(state.copyWith(
          status: UserStatus.success,
          message: '',
          user: value,
          users: const [],
        ));
      }).onError((AppException error, stackTrace) {
        emit(state.copyWith(
          status: UserStatus.failure,
          message: error.message,
          user: User.empty,
          users: const [],
        ));
      });
    } catch (e) {
      emit(state.copyWith(
        status: UserStatus.failure,
        message: e.toString(),
        user: User.empty,
        users: const [],
      ));
    }
  }

  _onReset(
    UserReset event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(
      status: UserStatus.initial,
      message: '',
      user: User.empty,
      users: const [],
    ));
  }

  _onCreateUser(
    UserCreation event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(
      status: UserStatus.creation,
    ));
  }

  _onCancelCreation(
    UserCancelCreation event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(
      status: UserStatus.cancelCreation,
    ));
  }

  _onConfirmCreation(
    UserConfirmCreation event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(
      status: UserStatus.inProgress,
    ));
    try {
      await _userRepository.create(event.user).then((value) {
        emit(state.copyWith(
          status: UserStatus.created,
          message: '',
          user: value,
        ));
      }).onError((AppException error, stackTrace) {
        emit(state.copyWith(
          status: UserStatus.failure,
          message: error.message,
          user: User.empty,
          users: const [],
        ));
      });
    } catch (e) {
      emit(state.copyWith(
        status: UserStatus.failure,
        message: e.toString(),
        user: User.empty,
        users: const [],
      ));
    }
  }

  _onUpdate(
    UserUpdate event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(
      status: UserStatus.inProgress,
    ));
    try {
      // TODO implement creation Entity
      await _userRepository.update(event.user).then((value) {
        emit(state.copyWith(
          status: UserStatus.updated,
          message: '',
          user: event.user,
        ));
      }).onError((AppException error, stackTrace) {
        emit(state.copyWith(
          status: UserStatus.failure,
          message: error.message,
          user: User.empty,
        ));
      });
    } catch (e) {
      emit(state.copyWith(
        status: UserStatus.failure,
        message: e.toString(),
        user: User.empty,
        users: const [],
      ));
    }
  }

  _onDelete(
    UserDelete event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(
      status: UserStatus.inProgress,
    ));
    try {
      // TODO implement creation Entity
      await _userRepository.delete(event.user).then((value) {
        emit(state.copyWith(
          status: UserStatus.deleted,
          message: '',
        ));
      }).onError((AppException error, stackTrace) {
        emit(state.copyWith(
          status: UserStatus.failure,
          message: error.message,
          user: User.empty,
        ));
      });
    } catch (e) {
      emit(state.copyWith(
        status: UserStatus.failure,
        message: e.toString(),
        user: User.empty,
        users: const [],
      ));
    }
  }

  _onFetchAll(
    UserFetchAll event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(
      status: UserStatus.inProgress,
      message: '',
      user: User.empty,
      users: const [],
    ));
    try {
      await _userRepository.getAll().then((value) {
        emit(state.copyWith(
          status: UserStatus.success,
          message: '',
          user: User.empty,
          users: value,
        ));
      }).onError((AppException error, stackTrace) {
        emit(state.copyWith(
          status: UserStatus.failure,
          message: error.message,
          user: User.empty,
          users: const [],
        ));
      });
    } catch (e) {
      emit(state.copyWith(
        status: UserStatus.failure,
        message: e.toString(),
        user: User.empty,
        users: const [],
      ));
    }
  }

  _onResetPassword(
    UserResetPassword event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(
      status: UserStatus.inProgress,
    ));
    await _userRepository.resetPassword(event.email).then((value) {
      emit(state.copyWith(
        status: UserStatus.passwordReseted,
        message:
            "Nous t'avons envoyé un email pour réinitialiser ton mot de passe.",
      ));
    }).onError<firebase_auth.FirebaseAuthException>((error, stackTrace) {
      if (error.code == 'user-not-found') {
        emit(state.copyWith(
          status: UserStatus.emailNotFound,
          message: 'Aucun compte n\'est associé à cette adresse email',
        ));
      } else {
        emit(state.copyWith(
          status: UserStatus.failure,
          message: error.message,
        ));
      }
    }).onError<AppException>((error, stackTrace) {
      emit(state.copyWith(
        status: UserStatus.failure,
        message: error.message,
      ));
    });
  }
}
