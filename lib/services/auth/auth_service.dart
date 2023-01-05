import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthService {
  static FirebaseAuth firebaseAuthInstance = FirebaseAuth.instance;

  Future<User?> signUp(
      {required String email, required String password}) async {
    User? user;
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((userCredential) => user = userCredential.user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email.');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    return user;
  }

  Future<User?> signIn({
    required String email,
    required String password,
  }) async {
    User? user;
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((userCredential) => user = userCredential.user);
    return user;
  }

  Future<User?> signInWithGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          // handle the error here
          rethrow;
        } else if (e.code == 'invalid-credential') {
          // handle the error here
          rethrow;
        }
      } catch (e) {
        // handle the error here
        throw Exception(e);
      }
    }

    return user;
  }

  Future<User?> signInWithApple() async {
    // 1. perform the sign-in request
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );
    final oAuthProvider = OAuthProvider('apple.com');
    final credential = oAuthProvider.credential(
      idToken: appleCredential.identityToken!,
      accessToken: appleCredential.authorizationCode,
    );
    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    final firebaseUser = userCredential.user!;
    if (appleCredential.givenName != null &&
        appleCredential.familyName != null) {
      final displayName =
          '${appleCredential.givenName} ${appleCredential.familyName}';
      await firebaseUser.updateDisplayName(displayName);
    }
    if (appleCredential.email != null) {
      final email = appleCredential.email!;
      await firebaseUser.updateEmail(email);
    }
    return firebaseUser;
  }

  Future<void> signOut() async {
    try {
      await firebaseAuthInstance.signOut();
    } catch (e) {
      throw Exception(e);
    }
  }

  /// Allow users to sign in with several methods to a single one account.
  Future<void> linkWithCredentials(AuthCredential credential) async {
    try {
      final userCredential = await FirebaseAuth.instance.currentUser
          ?.linkWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "provider-already-linked":
          throw Exception("Ce fournisseur est déjà associé au compte.");
        case "invalid-credential":
          throw Exception(
              "Les informations du compte fournisseur ne sont pas valides.");
        case "credential-already-in-use":
          throw Exception(
              "Ce compte de fournisseur est déjà utilisé par un autre compte.");
        case "email-already-in-use":
          throw Exception(
              "L'email de ce compte de fournisseur est déjà utilisé par un autre compte.");
        default:
          throw Exception(
              "Une erreur s'est produite lors de la liaison de votre compte");
      }
    }
  }

  //Reset password
  Future<void> resetPassword(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
}
