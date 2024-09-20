import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:project_todo/auth/auth.dart';
import 'package:project_todo/auth/main_page.dart';
import 'package:project_todo/constants/string_const/string_const.dart';
import 'package:project_todo/presentation/screen/login/login.dart';
import 'package:project_todo/presentation/screen/home/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await dotenv.load();
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
      home: onboarding ? const MainPage() : const MyHomePage(),
    );
  }
}
