import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../constants/firestore_constants.dart';
import '../../models/messages_chat.dart';

class ChatSoporteController extends GetxController {
  var isLoading = false;

  File? imageFile;

  var imageUrl = '';

  List<QueryDocumentSnapshot> listMessage = new List.from([]);

  final TextEditingController textEditingController = TextEditingController();
  final ScrollController listScrollController = ScrollController();
  final FocusNode focusNode = FocusNode();

  UploadTask uploadFile(File image, String fileName) {
    Reference reference = FirebaseStorage.instance.ref().child(fileName);
    UploadTask uploadTask = reference.putFile(image);
    return uploadTask;
  }

  void sendMessage({
    var content,
    var type,
  }) {
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection(FirestoreConstants.support)
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection(FirebaseAuth.instance.currentUser!.uid)
        .doc(DateTime.now().millisecondsSinceEpoch.toString());
    MessageChat messageChat = MessageChat(
      idFrom: FirebaseAuth.instance.currentUser!.uid,
      idTo: 'supportChat',
      timeStamp: DateTime.now().millisecondsSinceEpoch.toString(),
      content: content,
      type: type.toString(),
    );
    FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.set(
        documentReference,
        messageChat.toJson(),
      );
    });
  }
}
