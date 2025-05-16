import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_todo/constants/colors/colors.dart';
import 'package:project_todo/firebase/firebase_service.dart';
import 'package:project_todo/model/note.dart';
import 'package:project_todo/presentation/widgets/add_task_text_field.dart';

class EditScreen extends ConsumerStatefulWidget {
  EditScreen({
    super.key,
    required this.note,
  });
  Note note;

  @override
  ConsumerState<EditScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends ConsumerState<EditScreen> {
  TextEditingController? title;
  TextEditingController? subTitle;

  final focusNode1 = FocusNode();
  final focusNode2 = FocusNode();

  int indexx = 0;

  @override
  void initState() {
    super.initState();
    title = TextEditingController(text: widget.note.title);
    subTitle = TextEditingController(text: widget.note.subTitle);
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
                    FirestoreDataSource().edit(
                      widget.note.id!,
                      subTitle!.text,
                      title!.text,
                    );
                    Navigator.pop(context);
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
                    Navigator.pop(context);
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
