import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

      return true;
    } catch (e) {
      return true;
    }
  }
}
