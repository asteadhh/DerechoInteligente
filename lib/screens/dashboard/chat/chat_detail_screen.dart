import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'user_chat.dart';

class ChatDetail extends StatefulWidget {
  const ChatDetail(
      {Key? key,
      required this.friendUid,
      required this.chatId,
      required this.chatId2
      // required this.friendName,
      })
      : super(key: key);
  final String friendUid;
  final String chatId;
  final String chatId2;
  // final String friendName;

  @override
  State<ChatDetail> createState() => _ChatDetailState(
        friendUid,
        chatId,
        chatId2,
        // friendName,
      );
}

class _ChatDetailState extends State<ChatDetail> {
  _ChatDetailState(
    this.friendUid,
    this.chatId,
    this.chatId2,
    // this.friendName,
  );
  CollectionReference chats = FirebaseFirestore.instance.collection('chats');
  final String friendUid;
  final chatId;
  final chatId2;
  // final String friendName;
  final currentUserID = FirebaseAuth.instance.currentUser!.uid;
  var chatDocId;
  var chatDocId2;

  @override
  // void initState() {
  //   // ignore: todo
  //   super.initState();
  //   chats
  //       .where(
  //         'users',
  //         isEqualTo: {'sendTo': friendUid, 'started': currentUserID},
  //       )
  //       .limit(1)
  //       .get()
  //       .then((QuerySnapshot querySnapshot) {
  //         if (querySnapshot.docs.isNotEmpty) {
  //           chatDocId = querySnapshot.docs.single.id;
  //         } else {
  //           firebaseFirestore.collection('chats').add({
  //             'users': {'sendTo': friendUid, 'started': currentUserID}
  //           }).then((value) {
  //             chatDocId = value;
  //           });
  //         }
  //         ;
  //       })
  //       .catchError((error) {
  //         print(error);
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    // return PlatformText(chatId);
    return UserChat(
      friendUid: friendUid,
      chatId: chatId,
      chatId2: chatId2,
    );
  }
}
