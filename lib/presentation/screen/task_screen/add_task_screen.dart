import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_todo/constants/colors/colors.dart';
import 'package:project_todo/logic/todo_provider.dart';
import 'package:project_todo/presentation/widgets/add_task_text_field.dart';

class AddTaskScreen extends ConsumerStatefulWidget {
  const AddTaskScreen({super.key});

  @override
  ConsumerState<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends ConsumerState<AddTaskScreen> {
  final titleController = TextEditingController();
  final subTitleController = TextEditingController();

  final focusNode1 = FocusNode();
  final focusNode2 = FocusNode();

  int indexx = 0;
  @override
  Widget build(BuildContext context) {
    final note = ref.watch(noteProvider);
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
              maxLines: 4,
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
                      ref.read(noteProvider.notifier).addNote(
                            titleController.text.trim(),
                            subTitleController.text.trim(),
                          );
                      print('Note Added successfully ${titleController.text}');
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
