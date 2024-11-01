import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:project_todo/constants/colors/colors.dart';
import 'package:project_todo/presentation/screen/task_screen/add_task_screen.dart';
import 'package:project_todo/presentation/widgets/task_widget.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({
    super.key,
  });

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  bool show = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      floatingActionButton: Visibility(
        visible: show,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const AddTaskScreen();
                },
              ),
            );
          },
          backgroundColor: ColorsConst.purple,
          child: const Icon(
            Icons.add,
            size: 30,
            color: ColorsConst.white,
          ),
        ),
      ),
      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          if (notification.direction == ScrollDirection.forward) {
            setState(() {
              show = true;
            });
          }
          if (notification.direction == ScrollDirection.reverse) {
            setState(() {
              show = false;
            });
          }
          return true;
        },
        child: StreamBuilder<QuerySnapshot>(
          stream: ,
          builder: (context, snapshot) {
            return ListView.builder(
              itemCount: 10,
              itemBuilder: (builder, context) {
                return const TaskWidget();
              },
            );
          },
        ),
      ),
    );
  }
}
