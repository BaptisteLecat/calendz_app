import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:calendz_app/domain/repository/auth_repository/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  static bool appleSignInAvailable = false;
  final AuthRepository authRepository = AuthRepository();
  AuthBloc() : super(UnAuthenticated()) {
    // When User Presses the SignIn Button, we will send the SignInRequested Event to the AuthBloc to handle it and emit the Authenticated State if the user is authenticated
    on<SignInRequested>((event, emit) async {
      emit(Loading());
      await authRepository
          .signIn(email: event.email, password: event.password)
          .then((value) {
        emit(Authenticated());
      }).onError((error, stackTrace) {
        print(error.toString());
        if (error is FirebaseAuthException) {
          if (error.code == 'user-not-found') {
            emit(AuthError('Aucun utilisateur associé à cet email.'));
          } else if (error.code == 'wrong-password') {
            emit(AuthError('Mot de passe incorrect.'));
          }
        } else {
          emit(AuthError(error.toString()));
        }
      });
    });

    on<GoogleSignInRequested>((event, emit) async {
      emit(Loading());
      await authRepository.signInWithGoogle().then((value) {
        emit(Authenticated());
      }).onError((error, stackTrace) {
        print(error.toString());
        emit(AuthError(error.toString()));
      });
    });

    on<AppleSignInRequested>((event, emit) async {
      emit(Loading());
      await authRepository.signInWithApple().then((value) {
        emit(Authenticated());
      }).onError((error, stackTrace) {
        print(error.toString());
        emit(AuthError(error.toString()));
      });
    });

    // When User Presses the SignUp Button, we will send the SignUpRequest Event to the AuthBloc to handle it and emit the Authenticated State if the user is authenticated
    on<RegisterRequested>((event, emit) async {
      emit(Loading());
      try {
        await authRepository.register(
          email: event.email,
          password: event.password,
          firstname: event.firstname,
        );
        emit(Authenticated());
      } catch (e) {
        log(e.toString());
        emit(AuthError(e.toString()));
        emit(UnAuthenticated());
      }
    });
    // When User Presses the SignOut Button, we will send the SignOutRequested Event to the AuthBloc to handle it and emit the UnAuthenticated State
    on<LogOutRequested>((event, emit) async {
      emit(Loading());
      await authRepository.signOut();
      emit(UnAuthenticated());
    });
  }
}
