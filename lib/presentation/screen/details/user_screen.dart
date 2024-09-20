import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key, this.user});

  final String? user;

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Hello ${widget.user!}'),
      ),
    );
  }
}
