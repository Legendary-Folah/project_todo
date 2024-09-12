import 'package:flutter/material.dart';
import 'package:project_todo/constants/colors/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.focusNode,
    required this.icon,
    required this.text,
    this.suffixIcon,
    required this.obscureText,
    this.validator,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final Icon icon;
  final String text;
  final IconButton? suffixIcon;
  final bool obscureText;
  final FormFieldValidator<String?>? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: ColorsConst.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        controller: controller,
        validator: validator,
        focusNode: focusNode,
        obscureText: obscureText,
        autocorrect: false,
        decoration: InputDecoration(
          prefixIcon: icon,
          hintText: text,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          suffixIcon: suffixIcon,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: ColorsConst.grey,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: ColorsConst.purple,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
