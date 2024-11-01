import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_todo/model/note_model.dart';
import 'package:project_todo/presentation/widgets/flutter_toast.dart';
import 'package:uuid/uuid.dart';

class FirestoreDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool?> createUser(String email) async {
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .set({'id': _auth.currentUser!.uid, "email": email});
      print('Email: $email');
      return true;
    } catch (e) {
      return true;
    }
  }

  Future<bool> addNote(String title, String subTitle) async {
    try {
      final uuid = const Uuid().v4();
      final date = DateTime.now();
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('notes')
          .doc(uuid)
          .set({
        'id': _auth.currentUser!.uid,
        'subtitle': subTitle,
        'isDone': false,
        'time': '${date.hour} : ${date.minute}',
        "title": title
      });
      return true;
    } catch (e) {
      print('Error adding note: $e');
      return true;
    }
  }

  List getNotes(AsyncSnapshot snapshot) {
    try {
      final notesList = snapshot.data.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return Note(
          id: data['id'] ?? "",
          subTitle: data['subtitle'] ?? "",
          time: data['time'] ?? "",
          title: data['title'] ?? "",
        );
      }).toList();
      return notesList;
    } catch (e) {
      print('Error pasring notes: $e');
      return [];
    }
  }

  Stream<QuerySnapshot> stream() {
    return _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .collection('notes')
        .snapshots();
  }
}
