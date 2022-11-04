import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/firebase_auth_constants.dart';
import '../../utils/debouncer.dart';

class ChatController extends GetxController {
  var limit = 20.obs;
  var limitIncrement = 20.obs;
  var textSearch = ''.obs;

  changeTextSearch(var s) {
    textSearch.value = s;
    ;
  }

  bool isLoading = false;

  Debouncer searchDebouncer = Debouncer(milliseconds: 300);

  final ScrollController listScrollControllerAbrirChat = ScrollController();

  StreamController<bool> btnClearController = StreamController<bool>();

  // final Stream<QuerySnapshot> usersStream = FirebaseFirestore.instance
  //     .collection(FirestoreConstants.pathUserCollection)
  //     .where(
  //   FirestoreConstants.chattingWith,
  //   arrayContainsAny: [FirebaseAuth.instance.currentUser!.uid],
  // ).snapshots();

  final TextEditingController uidController = TextEditingController(
    text: 'K4osfi4Et3UzPFS7jHBsnEmyI1k2',
  );

  final TextEditingController mensajeController = TextEditingController();

  final TextEditingController searchBarTec = TextEditingController();

  final ScrollController listScrollController = ScrollController();

  @override
  void dispose() {
    super.dispose();
    btnClearController.close();
  }

  // FirebaseFirestore firebaseFirestore;

  // ChatController({required this.firebaseFirestore});

  updateStoreName(String name) {
    textSearch(name);
  }

  Future<void> updateDataFirestore(
      String collectionPath, String path, Map<String, String> dataNeedUpdate) {
    return firebaseFirestore
        .collection(collectionPath)
        .doc(path)
        .update(dataNeedUpdate);
  }

  Stream<QuerySnapshot> getStreamFireStore(
      String pathCollection, int limit, String? textSearch) {
    if (textSearch?.isEmpty == true) {
      return firebaseFirestore
          .collection(pathCollection)
          .limit(limit)

          //cambiar a nombre de usuario
          .where(FirebaseAuth.instance.currentUser!.uid, isEqualTo: textSearch)
          .snapshots();
    } else {
      return firebaseFirestore
          .collection(pathCollection)
          .limit(limit)
          .snapshots();
    }
  }

  @override
  void onInit() async {
    print("call onInit"); // this line not printing
    Get.put(() => ChatController());
    // btnClearController.close();
    // checkIsLogin();
    // print("ww");
    super.onInit();
  }
}
