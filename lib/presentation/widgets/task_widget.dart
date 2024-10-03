import 'package:flutter/material.dart';
import 'package:project_todo/constants/colors/colors.dart';
import 'package:project_todo/presentation/widgets/task_widget_tab.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({super.key});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Container(
          height: 120,
          width: double.infinity,
          decoration: BoxDecoration(
              color: ColorsConst.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 6,
                  blurRadius: 8,
                )
              ]),
          child: Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Container(
                  height: 120,
                  width: 100,
                  decoration: const BoxDecoration(
                    color: ColorsConst.purple,
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/man.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      const Text(
                        'ToDo',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorsConst.black,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'subtitle',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade400,
                          fontSize: 14,
                        ),
                      ),
                      const Spacer(),
                      const Row(
                        children: [
                          TaskWidgetTab(
                            text: 'Time',
                            icon: Icon(
                              Icons.timelapse,
                              color: ColorsConst.white,
                            ),
                          ),
                          SizedBox(width: 5),
                          TaskWidgetTab(
                            text: 'edit',
                            icon: Icon(
                              Icons.edit,
                              color: ColorsConst.white,
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
