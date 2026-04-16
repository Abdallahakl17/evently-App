import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  
  static final FirebaseAuth auth = FirebaseAuth.instance;

  static Future<UserCredential?> sigUP(String email, String password) async {
    try {
      final userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential;
    } on FirebaseAuthException catch (e) {
      log("SignIn error: ${e.code}");
      return null;
    }
  }

  static Future<UserCredential?> signIn(String email, String password) async {
    try {
      final userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential;
    } on FirebaseAuthException catch (e) {
      log("SignIn error: ${e.code}");
      return null;
    }
  }

  static Future<void> signOut() async {
    await auth.signOut();
    log("Logged out");
  }
}
