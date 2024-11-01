import 'package:flutter/material.dart';
import 'package:project_todo/constants/colors/colors.dart';
import 'package:project_todo/firebase/firebase_service.dart';
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

  int indexx = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        ColorsConst.customGreen,
                      ),
                      minimumSize: WidgetStatePropertyAll(
                        Size(150, 40),
                      ),
                    ),
                    onPressed: () {
                      FirestoreDataSource().addNote(
                        titleController.text,
                        subTitleController.text,
                      );
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "Add Task",
                      style: TextStyle(
                        color: ColorsConst.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        ColorsConst.error,
                      ),
                      minimumSize: WidgetStatePropertyAll(
                        Size(150, 40),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                        color: ColorsConst.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
