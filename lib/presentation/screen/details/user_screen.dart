import 'package:flutter/material.dart';
import 'package:project_todo/constants/colors/colors.dart';
import 'package:project_todo/presentation/widgets/task_widget.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({
    super.key,
  });

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: ColorsConst.purple,
          child: const Icon(
            Icons.add,
            size: 30,
            color: ColorsConst.white,
          ),
        ),
        body: TaskWidget());
  }
}
