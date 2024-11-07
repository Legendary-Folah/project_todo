import 'package:flutter/material.dart';
import 'package:project_todo/constants/colors/colors.dart';
import 'package:project_todo/model/note_model.dart';
import 'package:project_todo/presentation/widgets/add_task_text_field.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({
    super.key,
    this.note,
  });
  final Note? note;

  @override
  State<EditScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<EditScreen> {
  TextEditingController? title;
  TextEditingController? subTitle;

  final focusNode1 = FocusNode();
  final focusNode2 = FocusNode();

  int indexx = 0;

  @override
  void initState() {
    super.initState();
    title = TextEditingController(text: widget.note?.title);
    subTitle = TextEditingController(text: widget.note?.subTitle);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
      ),
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AddTaskTextField(
            controller: title!,
            text: 'Title',
            obscureText: false,
          ),
          const SizedBox(height: 10),
          AddTaskTextField(
            controller: subTitle!,
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
                    Navigator.of(context);
                  },
                  child: const Text(
                    "Update",
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
                    Navigator.of(context);
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
      )),
    );
  }
}
