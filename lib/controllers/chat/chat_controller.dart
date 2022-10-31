import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/firebase_auth_constants.dart';
import '../../constants/firestore_constants.dart';
import '../../models/messages_chat.dart';

class ChatUserPageController extends GetxController {
  late String currentUserId = FirebaseAuth.instance.currentUser!.uid;

  List<QueryDocumentSnapshot> listMessage = new List.from([]);

  var limit = 20.obs;
  var limitIncrement = 20.obs;
  var groupChatId = '';

  var peerData;

  File? imageFile;
  var isLoading = false;
  var isShowSticker = false;
  var imageUrl = '';

  final TextEditingController textEditingController = TextEditingController();
  final ScrollController listScrollController = ScrollController();
  final FocusNode focusNode = FocusNode();

  ChatUserPageController({required this.peerData});

  UploadTask uploadFile(File image, String fileName) {
    Reference reference = FirebaseStorage.instance.ref().child(fileName);
    UploadTask uploadTask = reference.putFile(image);
    return uploadTask;
  }

  Future<void> updateDataFirestore(String collectionPath, String docPath,
      Map<String, dynamic> dataNeedUpdate) {
    return FirebaseFirestore.instance
        .collection(collectionPath)
        .doc(docPath)
        .update(dataNeedUpdate);
  }

  Future<void> addChattingWithFirestore(
    String collectionPath,
    String docPath,
    String peerId,
  ) {
    return FirebaseFirestore.instance
        .collection(collectionPath)
        .doc(docPath)
        .update({
      FirestoreConstants.chattingWith: FieldValue.arrayUnion([peerId]),
    }).then((value) {
      FirebaseFirestore.instance.collection(collectionPath).doc(peerId).update({
        FirestoreConstants.chattingWith: FieldValue.arrayUnion([currentUserId]),
      });
    });
  }

  Stream<QuerySnapshot> getChatStream(RxString groupChatId, int limit) {
    return FirebaseFirestore.instance
        .collection(FirestoreConstants.pathMessageCollection)
        .doc(groupChatId.value)
        .collection(groupChatId.value)
        .orderBy(FirestoreConstants.timeStamp, descending: true)
        .limit(limit)
        .snapshots();
  }

  void sendMessage(
    var content,
    var type,
    var groupChatId,
    var currentUserId,
    var peerId,
  ) {
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection(FirestoreConstants.pathMessageCollection)
        .doc(groupChatId)
        .collection(groupChatId)
        .doc(DateTime.now().millisecondsSinceEpoch.toString());
    MessageChat messageChat = MessageChat(
      idFrom: currentUserId,
      idTo: peerId,
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

  @override
  void onInit() async {
    super.onInit();
    print("call onInit"); // this line not printing

    focusNode.addListener(onFocusChange);
    listScrollController.addListener(_scrollListener);

    readLocal();

    // checkIsLogin();
    print("Add Listener");
  }

  _scrollListener() {
    if (listScrollController.offset >=
            listScrollController.position.maxScrollExtent &&
        !listScrollController.position.outOfRange) {
      limit += limitIncrement.toInt();
    }
  }

  void onFocusChange() {
    if (focusNode.hasFocus) {
      isShowSticker = false;
    }
  }

  void readLocal() async {
    if (authController.currentUser!.uid.isNotEmpty == true) {
      currentUserId = authController.currentUser!.uid;
    }
    if (currentUserId.hashCode <= peerData.id.hashCode) {
      groupChatId = '${currentUserId}-${peerData.id}';
    } else {
      groupChatId = '${peerData.id}-${currentUserId}';
    }

    print('READ LOCAL');
    await addChattingWithFirestore(
      FirestoreConstants.pathUserCollection,
      currentUserId,
      peerData.id,
    );
    return null;
  }
}
