import 'package:flutter/material.dart';
import 'package:project_todo/constants/colors/colors.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({super.key});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConst.white,
      body: SafeArea(
          child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Row(
          children: [
            Text(
              'Hello',
            )
          ],
        ),
      )),
    );
  }
}
