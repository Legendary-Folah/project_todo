import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_todo/model/note_model.dart';
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

  Future<bool?> addNote(String title, String subTitle, int image) async {
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
        'isDOne': false,
        'image': image,
        'time': date,
        "title": title
      });
      return true;
    } catch (e) {
      return true;
    }
  }

  List getNotes(AsyncSnapshot snapshot) {
    final notesList = snapshot.data.docs.map((doc) {
      final data = doc.data as Map<String, dynamic>;
      return Note(id: id, image: image, subTitle: subTitle, time: time, title: title,),
    });
  }
}
