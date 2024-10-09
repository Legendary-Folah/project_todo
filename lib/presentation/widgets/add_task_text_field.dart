import 'package:flutter/material.dart';
import 'package:project_todo/constants/colors/colors.dart';

class AddTaskTextField extends StatelessWidget {
  const AddTaskTextField({
    super.key,
    required this.controller,
    this.focusNode,
    required this.text,
    this.suffixIcon,
    required this.obscureText,
    this.maxLines,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final String text;
  final IconButton? suffixIcon;
  final bool obscureText;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: ColorsConst.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          maxLines: maxLines,
          controller: controller,
          focusNode: focusNode,
          decoration: InputDecoration(
            hintText: text,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
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
      ),
    );
  }
}
