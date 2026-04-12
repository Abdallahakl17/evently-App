import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final FirebaseAuth auth = FirebaseAuth.instance;

 static Future signUp(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      log("Account created successfully");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log("Weak password");
      } else if (e.code == 'email-already-in-use') {
        log("Email already exists");
      }
    }
  }
 static Future signIn(String email, String password) async {
  try {
  final user =    await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    log("Login success"); return user;

  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      log("User not found");
    } else if (e.code == 'wrong-password') {
      log("Wrong password");
    }  return null;
  }
}
static Future signOut() async {
  await FirebaseAuth.instance.signOut();    log("Logged out");

}
}