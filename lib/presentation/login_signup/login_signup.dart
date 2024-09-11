import 'package:flutter/material.dart';
import 'package:project_todo/constants/colors/colors.dart';
import 'package:project_todo/constants/string_const/string_const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginSignup extends StatefulWidget {
  const LoginSignup({super.key});

  @override
  State<LoginSignup> createState() => _LoginSignupState();
}

class _LoginSignupState extends State<LoginSignup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsConst.purple,
        actions: [
          const SizedBox(
            width: 200,
            child: Text(
              StringConst.onboardingEnabled,
              style: TextStyle(
                fontSize: 10,
                color: ColorsConst.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          IconButton(
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              prefs.setBool(StringConst.onboardingKey, false);
            },
            icon: const Icon(
              Icons.restart_alt,
              color: ColorsConst.white,
            ),
          ),
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          Text('Hello there'),
          Text('Hello there'),
          Text('Hello there'),
          Text('Hello there'),
        ],
      )),
    );
  }
}
