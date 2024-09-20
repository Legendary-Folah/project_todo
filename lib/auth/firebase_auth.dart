import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_todo/presentation/widgets/flutter_toast.dart';

abstract class FirebaseAuthDataSource {
  Future<void> registerUser(
    String email,
    String password,
    String confirmPassword,
  );
  Future<void> logIn(
    String email,
    String password,
  );
}

class AuthRemote extends FirebaseAuthDataSource {
  @override
  Future<void> registerUser(
      String email, String password, String confirmPassword) async {
    try {
      if (confirmPassword == password) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.trim(),
          password: password.trim(),
        );
        CustomFlutterToast.successFlutterToast('Registered successfully');
      } else {
        CustomFlutterToast.errorFlutterToast('Passwords do not match');
      }
    } catch (e) {
      CustomFlutterToast.errorFlutterToast(e.toString());
    }
  }

  @override
  Future<void> logIn(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      CustomFlutterToast.successFlutterToast('Login successful');
    } catch (e) {
      CustomFlutterToast.errorFlutterToast(e.toString());
    }
  }
}
