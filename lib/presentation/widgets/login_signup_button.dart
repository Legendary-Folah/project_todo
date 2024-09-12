import 'package:flutter/material.dart';
import 'package:project_todo/constants/colors/colors.dart';

class LoginSignUpButton extends StatelessWidget {
  const LoginSignUpButton({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
          color: ColorsConst.purple,
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextButton(
          onPressed: () {},
          child: Text(
            text,
            style: const TextStyle(
              color: ColorsConst.white,
              fontSize: 16,
              letterSpacing: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}
