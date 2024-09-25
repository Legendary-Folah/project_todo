import 'package:flutter/material.dart';
import 'package:project_todo/constants/colors/colors.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({
    super.key,
  });

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConst.background,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: ColorsConst.purple,
        child: const Icon(
          Icons.add,
          size: 30,
          color: ColorsConst.white,
        ),
      ),
      body: const Center(
        child: Text(
          'Hello',
        ),
      ),
    );
  }
}
