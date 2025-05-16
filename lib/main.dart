import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_todo/auth/auth.dart';
import 'package:project_todo/constants/colors/colors.dart';
import 'package:project_todo/constants/string_const/string_const.dart';
import 'package:project_todo/presentation/screen/details/user_screen.dart';
import 'package:project_todo/presentation/screen/home/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await dotenv.load();
  final prefs = await SharedPreferences.getInstance();
  final onboarding = prefs.getBool(StringConst.onboardingKey) ?? false;
  runApp(ProviderScope(
    child: MyApp(
      onboarding: onboarding,
    ),
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
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return const UserScreen();
            } else {
              return onboarding ? const AuthPage() : const MyHomePage();
            }
          } else {
            return const CircularProgressIndicator(
              color: ColorsConst.purple,
            );
          }
        },
      ),
    );
  }
}
