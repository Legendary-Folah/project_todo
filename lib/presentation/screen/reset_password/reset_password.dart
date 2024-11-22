import 'package:flutter/material.dart';
import 'package:project_todo/constants/colors/colors.dart';
import 'package:project_todo/constants/validation/form_validations.dart';
import 'package:project_todo/firebase/firebase_service.dart';
import 'package:project_todo/presentation/screen/details/user_screen.dart';
import 'package:project_todo/presentation/screen/login/login.dart';
import 'package:project_todo/presentation/widgets/custom_text_field.dart';
import 'package:project_todo/presentation/widgets/login_signup_button.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({
    super.key,
  });

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final resetPasswordController = TextEditingController();
  final focusNode = FocusNode();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConst.white,
      appBar: AppBar(
        backgroundColor: ColorsConst.purple,
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextField(
                  controller: resetPasswordController,
                  focusNode: focusNode,
                  keyboardType: TextInputType.emailAddress,
                  icon: Icon(Icons.email,
                      color: focusNode.hasFocus
                          ? ColorsConst.purple
                          : ColorsConst.grey),
                  text: 'please input email address...',
                  obscureText: false,
                  validator: (value) {
                    return FormValidations.validateEmailField(value);
                  },
                ),
                LoginSignUpButton(
                  text: 'Reset Password',
                  onPressed: () {
                    _submitForm();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (formKey.currentState?.validate() ?? false) {
      FirestoreDataSource().resetPassword(resetPasswordController.text);
      Future.delayed(
        const Duration(milliseconds: 1500),
        () {
          Navigator.pop(context);
        },
      );
    }
  }
}
