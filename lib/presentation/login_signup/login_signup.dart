import 'package:flutter/material.dart';
import 'package:project_todo/constants/colors/colors.dart';
import 'package:project_todo/constants/string_const/string_const.dart';
import 'package:project_todo/presentation/widgets/custom_text_field.dart';
import 'package:project_todo/presentation/widgets/login_signup_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginSignup extends StatefulWidget {
  const LoginSignup({super.key});

  @override
  State<LoginSignup> createState() => _LoginSignupState();
}

class _LoginSignupState extends State<LoginSignup> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final focusNode1 = FocusNode();
  final focusNode2 = FocusNode();

  bool isObscure = false;
  void visible() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsConst.white,
        actions: [
          const SizedBox(
            width: 200,
            child: Text(
              StringConst.onboardingEnabled,
              style: TextStyle(
                fontSize: 10,
                color: ColorsConst.black,
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
              color: ColorsConst.purple,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Image.asset(
                StringConst.journal,
                width: 200,
                height: 130,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 40),
              CustomTextField(
                controller: emailController,
                focusNode: focusNode1,
                icon: Icon(Icons.email,
                    color: focusNode1.hasFocus
                        ? ColorsConst.purple
                        : ColorsConst.grey),
                text: 'Email',
                obscureText: false,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: passwordController,
                focusNode: focusNode2,
                icon: Icon(Icons.password,
                    color: focusNode2.hasFocus
                        ? ColorsConst.purple
                        : ColorsConst.grey),
                text: 'Password',
                obscureText: isObscure ? false : true,
                suffixIcon: IconButton(
                  onPressed: () {
                    visible();
                  },
                  icon: const Icon(
                    Icons.remove_red_eye,
                    color: ColorsConst.grey,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      "Don't have an account yet ?",
                      style: TextStyle(
                        color: ColorsConst.black,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 3),
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
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const LoginSignUpButton(
                text: 'Log In',
              )
            ],
          ),
        ),
      ),
    );
  }
}
