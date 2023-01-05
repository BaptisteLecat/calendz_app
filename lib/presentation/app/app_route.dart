import 'dart:developer';

import 'package:calendz_app/presentation/feature/auth/views/done_profile_setup_screen.dart';
import 'package:calendz_app/presentation/feature/auth/views/login_screen.dart';
import 'package:calendz_app/presentation/feature/auth/views/on_boarding_screen.dart';
import 'package:calendz_app/presentation/feature/auth/views/password_recovery_screen.dart';
import 'package:calendz_app/presentation/feature/auth/views/sign_up_verification_screen.dart';
import 'package:calendz_app/presentation/feature/auth/views/signup_screen.dart';
import 'package:calendz_app/presentation/feature/auth/views/terms_of_services_screen.dart';
import 'package:calendz_app/presentation/feature/auth/views/verification_method_screen.dart';
import 'package:calendz_app/presentation/feature/home/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  onbording(path: '/onbording', screen: OnBoardingScreen()),

  login(path: '/login', screen: LoginScreen()),
  loginFromPasswordRecovery(path: '/loginFromPasswordRecovery'),
  passwordRecovery(path: '/passwordRecovery', screen: PasswordRecoveryScreen()),
  verificationMethod(
      path: '/verificationMethod', screen: VerificationMethodScreen()),

  signup(path: '/signup', screen: SignUpScreen()),
  termsOfServices(path: '/termsOfServices', screen: TermsOfServicesScreen()),
  doneProfileSetup(path: '/doneProfileSetup', screen: DoneProfileSetupScreen()),
  signUpVerification(
      path: '/signUpVerification', screen: SignUpVerificationScreen()),

  home(path: '/home');

  final String path;
  final Widget? screen;

  const AppRoute({required this.path, this.screen});

  static List<GoRoute> getRoutes() {
    return [
      GoRoute(
        name: AppRoute.home.name,
        path: AppRoute.home.path,
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        name: AppRoute.onbording.name,
        path: AppRoute.onbording.path,
        builder: (context, state) => AppRoute.onbording.screen!,
      ),
      GoRoute(
        name: AppRoute.login.name,
        path: AppRoute.login.path,
        builder: (context, state) => AppRoute.login.screen!,
      ),
      GoRoute(
        name: AppRoute.loginFromPasswordRecovery.name,
        path: AppRoute.loginFromPasswordRecovery.path,
        builder: (context, state) =>
            const LoginScreen(fromPasswordRecovery: true),
      ),
      GoRoute(
        name: AppRoute.passwordRecovery.name,
        path: AppRoute.passwordRecovery.path,
        builder: (context, state) => AppRoute.passwordRecovery.screen!,
      ),
      GoRoute(
        name: AppRoute.verificationMethod.name,
        path: AppRoute.verificationMethod.path,
        builder: (context, state) => AppRoute.verificationMethod.screen!,
      ),
      GoRoute(
        name: AppRoute.termsOfServices.name,
        path: AppRoute.termsOfServices.path,
        builder: (context, state) => AppRoute.termsOfServices.screen!,
      ),
      GoRoute(
        name: AppRoute.doneProfileSetup.name,
        path: AppRoute.doneProfileSetup.path,
        builder: (context, state) => AppRoute.doneProfileSetup.screen!,
      ),
      GoRoute(
        name: AppRoute.signUpVerification.name,
        path: AppRoute.signUpVerification.path,
        builder: (context, state) => AppRoute.signUpVerification.screen!,
      ),
      GoRoute(
        name: AppRoute.signup.name,
        path: AppRoute.signup.path,
        builder: (context, state) => AppRoute.signup.screen!,
      ),
    ];
  }
}
