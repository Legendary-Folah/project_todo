import 'package:flutter/material.dart';
import 'package:project_todo/presentation/screen/login/login.dart';
import 'package:project_todo/presentation/screen/signup/sign_up.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;
  void toPage() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLogin) {
      return Login(showAuth: toPage);
    } else {
      return SignUp(showAuth: toPage);
    }
  }
}
