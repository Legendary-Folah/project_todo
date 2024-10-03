import 'package:flutter/material.dart';
import 'package:project_todo/constants/colors/colors.dart';

class TaskWidgetTab extends StatelessWidget {
  const TaskWidgetTab({
    super.key,
    required this.text,
    required this.icon,
  });

  final String text;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 28,
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: ColorsConst.customGreen,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 6,
          ),
          child: Row(
            children: [
              icon,
              const SizedBox(width: 5),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 12,
                  color: ColorsConst.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
