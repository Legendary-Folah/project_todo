import 'package:flutter/material.dart';
import 'package:project_todo/auth/firebase_auth.dart';
import 'package:project_todo/constants/colors/colors.dart';
import 'package:project_todo/constants/string_const/string_const.dart';
import 'package:project_todo/constants/validation/form_validations.dart';
import 'package:project_todo/presentation/widgets/custom_text_field.dart';
import 'package:project_todo/presentation/widgets/login_signup_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({
    super.key,
    required this.showAuth,
  });

  final VoidCallback showAuth;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
  void initState() {
    super.initState();
    focusNode1.addListener(() {
      setState(() {});
    });
    focusNode2.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConst.white,
      appBar: AppBar(
        backgroundColor: ColorsConst.white,
        actions: [
          // const SizedBox(
          //   width: 200,
          //   child: Text(
          //     StringConst.onboardingEnabled,
          //     style: TextStyle(
          //       fontSize: 10,
          //       color: ColorsConst.black,
          //     ),
          //     textAlign: TextAlign.center,
          //   ),
          // ),
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
                height: 180,
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
                validator: (value) {
                  FormValidations.validateEmailField(value);
                  return null;
                },
              ),
              const SizedBox(height: 30),
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
                  icon: Icon(
                    isObscure ? Icons.visibility_off : Icons.visibility,
                    color: ColorsConst.grey,
                  ),
                ),
                validator: (value) {
                  FormValidations.validateRequiredField(value);
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      "Don't have an account yet ?",
                      style: TextStyle(
                        color: ColorsConst.black,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 3),
                    GestureDetector(
                      onTap: widget.showAuth,
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 30,
                          color: ColorsConst.purple,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              LoginSignUpButton(
                text: 'Login',
                onPressed: () {
                  AuthRemote().logIn(
                    emailController.text,
                    passwordController.text,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
