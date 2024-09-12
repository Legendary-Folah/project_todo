import 'package:flutter/material.dart';
import 'package:project_todo/constants/colors/colors.dart';
import 'package:project_todo/constants/string_const/string_const.dart';
import 'package:project_todo/presentation/widgets/custom_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginSignup extends StatefulWidget {
  const LoginSignup({super.key});

  @override
  State<LoginSignup> createState() => _LoginSignupState();
}

class _LoginSignupState extends State<LoginSignup> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final focusNode1 = FocusNode();
  final focusNode2 = FocusNode();

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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 15),
              Image.asset(
                StringConst.note,
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 30),
              CustomTextField(
                controller: emailController,
                focusNode: focusNode1,
                icon: Icon(Icons.email,
                    color: focusNode1.hasFocus
                        ? ColorsConst.purple
                        : ColorsConst.grey),
                text: 'Email',
              ),
              const SizedBox(height: 5),
              CustomTextField(
                controller: passwordController,
                focusNode: focusNode2,
                icon: Icon(Icons.password,
                    color: focusNode2.hasFocus
                        ? ColorsConst.purple
                        : ColorsConst.grey),
                text: 'Password',
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    "Don't have an account yet ?",
                    style: TextStyle(
                      color: ColorsConst.black,
                      fontSize: 14,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 14,
                        color: ColorsConst.purple,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
