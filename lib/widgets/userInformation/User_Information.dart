import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulpox_admin/constants/firebase_auth_constants.dart';

import '../../controllers/LoginController/login_controller.dart';

class UserInformationDataText extends GetView<LoginController> {
  UserInformationDataText({
    this.uid,
    required this.data,
    this.color = Colors.black,
    this.fontSize = 12,
    this.maxLines = 1,
    this.overflow = TextOverflow.ellipsis,
    super.key,
  });
  var uid;
  String data;

  var fontSize;
  var color;
  var maxLines;
  var overflow;

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put<LoginController>(LoginController());
    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance
          .collection('users')
          .doc(uid == null ? auth.currentUser!.uid : uid)
          .get(),
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError)
          return Center(
            child: Text(snapshot.hasError.toString()),
          );
        if (snapshot.hasData) {
          loginController.currentUserData = snapshot.data! as DocumentSnapshot;
        } else {}
        return snapshot.hasData
            ? AutoSizeText("${snapshot.data![data]}",
                style: TextStyle(
                  fontSize: fontSize,
                  color: color,
                ),
                maxLines: maxLines,
                overflow: overflow)

            //  Text(
            //     "${snapshot.data![data]}",
            //     // style: TextStyle(
            //     //     color: Colors.amber,
            //     //     fontSize: 18,
            //     //     fontWeight: FontWeight.bold),
            //   )
            : SizedBox.shrink();
      },
    );
  }
}
