import 'package:flutter/material.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:project_todo/constants/colors/colors.dart';
import 'package:project_todo/firebase/firebase_service.dart';
import 'package:project_todo/model/note.dart';
import 'package:project_todo/presentation/screen/edit_screen/edit_screen.dart';
import 'package:project_todo/presentation/widgets/task_widget_tab.dart';

class TaskWidget extends StatefulWidget {
  final Note? note;
  const TaskWidget({
    super.key,
    this.note,
  });

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  // bool checked = false;
  @override
  Widget build(BuildContext context) {
    bool isChecked = widget.note!.isDone!;
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
                spreadRadius: 7,
                blurRadius: 8,
              )
            ],
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 5,
                ),
                child: Container(
                  height: 100,
                  width: 80,
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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.note!.title!,
                            style: TextStyle(
                              fontWeight:
                                  isChecked ? FontWeight.w500 : FontWeight.bold,
                              color: ColorsConst.black,
                              fontSize: isChecked ? 16 : 18,
                              fontStyle: isChecked
                                  ? FontStyle.italic
                                  : FontStyle.normal,
                              decoration: isChecked
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                            ),
                          ),
                          MSHCheckbox(
                            size: 26,
                            style: MSHCheckboxStyle.stroke,
                            value: isChecked,
                            onChanged: (value) {
                              print('checked');
                              setState(() {
                                isChecked = !isChecked;
                              });
                              FirestoreDataSource().isDone(
                                widget.note!.id!,
                                isChecked,
                              );
                            },
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      widget.note!.subTitle!,
                      style: TextStyle(
                        fontWeight:
                            isChecked ? FontWeight.w500 : FontWeight.bold,
                        color: Colors.grey.shade400,
                        fontSize: isChecked ? 13 : 14,
                        fontStyle:
                            isChecked ? FontStyle.italic : FontStyle.normal,
                        decoration: isChecked
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    // const Spacer(),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: TaskWidgetTab(
                            text: widget.note!.time!,
                            icon: const Icon(
                              Icons.timelapse,
                              color: ColorsConst.white,
                              size: 18,
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return EditScreen(
                                    note: widget.note!,
                                  );
                                },
                              ),
                            );
                          },
                          child: const TaskWidgetTab(
                            text: 'edit',
                            icon: Icon(
                              Icons.edit,
                              color: ColorsConst.white,
                              size: 20,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
