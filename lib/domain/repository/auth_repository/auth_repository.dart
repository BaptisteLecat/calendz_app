import 'package:calendz_app/domain/entity/user/user.dart';
import 'package:calendz_app/domain/repository/user_repository/user_repository.dart';
import 'package:calendz_app/services/auth/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthRepository {
  static AuthService firebaseAuthRepository = AuthService();
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<User> whoAmI({required firebase.User firebaseUser}) async {
    return UserRepository().getOne(docId: firebaseUser.uid).then((User user) {
      return user.copyWith(
        firebaseUser: firebaseUser,
      );
    });
  }

  Future<User> signIn({
    required String email,
    required String password,
  }) async {
    try {
      return await firebaseAuthRepository
          .signIn(email: email, password: password)
          .then((signedUser) async {
        return await whoAmI(firebaseUser: signedUser!).then((user) => user);
        /*if (signedUser != null) {
          return await whoAmI(firebaseUser: signedUser).then((user) => user);
        } else {
          throw Exception("Authentification échouée.");
        }*/
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<firebase.User> signInWithGoogle() async {
    try {
      return await firebaseAuthRepository.signInWithGoogle().then((signedUser) {
        if (signedUser != null) {
          return signedUser;
        } else {
          throw Exception("Authentification échouée.");
        }
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<firebase.User> signInWithApple() async {
    try {
      return await firebaseAuthRepository.signInWithApple().then((signedUser) {
        if (signedUser != null) {
          return signedUser;
        } else {
          throw Exception("Authentification échouée.");
        }
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<firebase.User> register({
    required String email,
    required String password,
    required String firstname,
  }) async {
    try {
      return await firebaseAuthRepository
          .signUp(email: email, password: password)
          .then((signedUser) async {
        if (signedUser != null) {
          await UserRepository().create(
            User(
              uid: signedUser.uid,
              email: email,
              firstname: firstname,
              firebaseUser: signedUser,
            ),
          );
          return signedUser;
        } else {
          throw Exception("Authentification échouée.");
        }
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    await firebaseAuthRepository.signOut();
  }
}
