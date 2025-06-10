import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_todo/model/note.dart';
import 'package:uuid/uuid.dart';

class FirestoreDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String users = "users";
  String notes = "notes";

  Future<bool?> createUser(String email) async {
    try {
      await _firestore
          .collection(users)
          .doc(_auth.currentUser!.uid)
          .set({'id': _auth.currentUser!.uid, "email": email});
      print('Email: $email , id: ${_auth.currentUser!.uid}');
      return true;
    } catch (e) {
      return true;
    }
  }

  List getNotes(AsyncSnapshot snapshot) {
    if (snapshot.data == null) {
      print('No data found');
      return [];
    }
    try {
      final notesList = snapshot.data.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return Note(
          id: doc.id,
          subTitle: data['subTitle'] ?? "",
          time: data['time'] ?? "",
          title: data['title'] ?? "",
          isDone: data['isDone'] ?? false,
        );
      }).toList();
      return notesList;
    } catch (e) {
      print('Error parsing notes: $e');
      return [];
    }
  }

  Stream<QuerySnapshot> stream() {
    // if (_auth.currentUser == null) {
    //   print("No authenticated user found");
    //   return const Stream.empty();
    // }
    return _firestore
        .collection(users)
        .doc(_auth.currentUser!.uid)
        .collection(notes)
        .snapshots();
  }

  Future<bool> isDone(String uuid, bool isDone) async {
    try {
      await _firestore
          .collection(users)
          .doc(_auth.currentUser!.uid)
          .collection(notes)
          .doc(uuid)
          .update({'isDone': isDone});
      return true;
    } catch (e) {
      print('Failed to update: $e');
      return true;
    }
  }

  Future<bool> edit(String uuid, String subTitle, String title) async {
    try {
      final date = DateTime.now();
      await _firestore
          .collection(users)
          .doc(_auth.currentUser!.uid)
          .collection(notes)
          .doc(uuid)
          .update({
        'subtitle': subTitle,
        'time': '${date.hour}:${date.minute} ${date.hour > 12 ? 'am' : 'pm'}',
        "title": title
      });
      return true;
    } catch (e) {
      print('Failed to update Tasks: $e');
      return true;
    }
  }

  Future<void> signout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print('Error sending reset password email : $e');
    }
  }

  Future<bool> checkIfEmailExists(String email) async {
    try {
      final querySnapshot = await _firestore
          .collection(users)
          .where("email", isEqualTo: email)
          .get();
      return querySnapshot.docs.isNotEmpty;
    } catch (e) {
      print('Error checking email existence: $e');
      return false;
    }
  }
}
