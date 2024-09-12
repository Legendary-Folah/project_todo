import 'package:flutter/material.dart';
import 'package:project_todo/constants/string_const/string_const.dart';
import 'package:project_todo/presentation/login_signup/login_signup.dart';
import 'package:project_todo/presentation/screen/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final onboarding = prefs.getBool(StringConst.onboardingKey) ?? false;
  runApp(MyApp(
    onboarding: onboarding,
  ));
}

class MyApp extends StatelessWidget {
  final bool onboarding;
  const MyApp({
    super.key,
    this.onboarding = false,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: onboarding ? const LoginSignup() : const MyHomePage(),
    );
  }
}
