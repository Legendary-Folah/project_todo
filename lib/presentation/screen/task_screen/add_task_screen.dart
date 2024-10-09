import 'package:flutter/material.dart';
import 'package:project_todo/presentation/widgets/add_task_text_field.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final titleController = TextEditingController();
  final subTitleController = TextEditingController();

  final focusNode1 = FocusNode();
  final focusNode2 = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
          child: Column(
        children: [
          AddTaskTextField(
            controller: titleController,
            text: 'Title',
            obscureText: false,
          ),
          const SizedBox(height: 10),
          AddTaskTextField(
            controller: subTitleController,
            text: 'SubTitle',
            obscureText: false,
            maxLines: 3,
          ),
        ],
      )),
    );
  }
}
