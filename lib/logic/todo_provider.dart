import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_todo/model/note.dart';
import 'package:uuid/uuid.dart';

class NoteNotifier extends StateNotifier<List<Note>> {
  NoteNotifier() : super([]);

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String users = "users";
  String notes = 'notes';

  Future<bool> addNote(String title, String subTitle) async {
    try {
      final uuid = const Uuid().v4();
      final date = DateTime.now();
      final note = Note(
        id: uuid,
        subTitle: subTitle,
        time:
            '${date.hour}:${date.minute.toString().padLeft(2, '0')} ${date.hour >= 12 ? 'pm' : 'am'}',
        title: title,
      );
      await _firestore
          .collection(users)
          .doc(_auth.currentUser!.uid)
          .collection(notes)
          .doc(uuid)
          .set(note.toJson());
      state = [...state, note];
      return true;
    } catch (e) {
      print('Error adding note: $e');
      return true;
    }
  }

  Future<bool> deleteNote(String uuid) async {
    try {
      await _firestore
          .collection(users)
          .doc(_auth.currentUser!.uid)
          .collection(notes)
          .doc(uuid)
          .delete();
      state = state.where((note) => note.id != uuid).toList();
      print('Note deleted successfully');
      return true;
    } catch (e) {
      print('Failed to delete Tasks: $e');
      return false;
    }
  }

  Future<bool> edit(
      String uuid, String subTitle, String title, String time) async {
    try {
      final date = DateTime.now();
      final updatedNotes = Note(
        id: uuid,
        subTitle: subTitle,
        time: '${date.hour}:${date.minute} ${date.hour > 12 ? 'am' : 'pm'}',
        title: title,
      );
      await _firestore
          .collection(users)
          .doc(_auth.currentUser!.uid)
          .collection(notes)
          .doc(uuid)
          .update(updatedNotes.toJson());
      state = [
        ...state,
        for (final note in state)
          if (note.id != uuid) updatedNotes
      ];
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
}

final noteProvider = StateNotifierProvider<NoteNotifier, List<Note>>((ref) {
  return NoteNotifier();
});
