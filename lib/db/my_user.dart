import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_chat.dart';

class MyUserDB {
  static Stream<UserChatInfo?> myUserStream(User? currentUser) async* {
    yield* FirebaseFirestore.instance
        .doc("users/${currentUser?.uid}")
        .snapshots()
        .map((DocumentSnapshot doc) {
      if (doc.exists) {
        return UserChatInfo.fromDocument(doc);
      } else {
        return null;
      }
    });
  }
}
