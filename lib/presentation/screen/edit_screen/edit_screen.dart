import 'package:flutter/material.dart';
import 'package:project_todo/constants/colors/colors.dart';
import 'package:project_todo/presentation/widgets/add_task_text_field.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<EditScreen> {
  final titleController = TextEditingController();
  final subTitleController = TextEditingController();

  final focusNode1 = FocusNode();
  final focusNode2 = FocusNode();

  int indexx = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          SizedBox(
            height: 150,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: "assets/images/".length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        indexx = index;
                      });
                    },
                    child: Container(
                      width: 180,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: indexx == index
                              ? ColorsConst.customGreen
                              : ColorsConst.grey,
                          width: 2.0,
                        ),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/$index.jpg",
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    ColorsConst.customGreen,
                  ),
                  minimumSize: WidgetStatePropertyAll(
                    Size(170, 45),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context);
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
                    Size(170, 45),
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
          )
        ],
      )),
    );
  }
}