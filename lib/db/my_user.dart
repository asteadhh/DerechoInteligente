import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_chat.dart';
import '../models/user_permitions.dart';

class MyUserDB {
  static Stream<UserChatInfo?> myUserDataStream(User? currentUser) async* {
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

class MyUserPermissionDB {
  static Stream<UserPermissionInfo?> myUserPermissionsStream(
      User? currentUser) async* {
    yield* FirebaseFirestore.instance
        .doc("permission/${currentUser?.uid}")
        .snapshots()
        .map((DocumentSnapshot doc) {
      if (doc.exists) {
        return UserPermissionInfo.fromDocument(doc);
      } else {
        return null;
      }
    });
  }
}
