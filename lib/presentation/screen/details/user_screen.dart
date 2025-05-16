import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_todo/auth/auth.dart';
import 'package:project_todo/constants/colors/colors.dart';
import 'package:project_todo/firebase/firebase_service.dart';
import 'package:project_todo/logic/todo_provider.dart';
import 'package:project_todo/presentation/screen/task_screen/add_task_screen.dart';
import 'package:project_todo/presentation/widgets/task_widget.dart';

class UserScreen extends ConsumerStatefulWidget {
  const UserScreen({
    super.key,
  });

  @override
  ConsumerState<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends ConsumerState<UserScreen> {
  bool show = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsConst.purple,
        actions: [
          IconButton(
            onPressed: () {
              ref.read(noteProvider.notifier).signout();
              Future.delayed(const Duration(milliseconds: 2000), () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const AuthPage();
                    },
                  ),
                );
              });
            },
            icon: const Icon(
              Icons.logout,
              color: ColorsConst.white,
            ),
          )
        ],
      ),
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
          stream: FirestoreDataSource().stream(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 5,
                  backgroundColor: ColorsConst.grey,
                  color: ColorsConst.purple,
                ),
              );
            }
            final notesList = FirestoreDataSource().getNotes(snapshot);
            return ListView.builder(
              itemCount: notesList.length,
              itemBuilder: (context, index) {
                final notes = notesList[index];
                return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (direction) {
                    print('Deleted ${notes.title}');
                    ref.read(noteProvider.notifier).deleteNote(notes.id);
                  },
                  child: TaskWidget(note: notes),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
