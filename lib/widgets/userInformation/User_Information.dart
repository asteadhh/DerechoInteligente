import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_network/image_network.dart';
import 'package:pulpox_admin/constants/firebase_auth_constants.dart';
import 'package:pulpox_admin/constants/firestore_constants.dart';

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
            : SizedBox.shrink();
      },
    );
  }
}

class UserInformationDataAvatar extends StatefulWidget {
  UserInformationDataAvatar({
    this.uid,
    super.key,
  });
  var uid;

  @override
  State<UserInformationDataAvatar> createState() =>
      _UserInformationDataAvatarState();
}

class _UserInformationDataAvatarState extends State<UserInformationDataAvatar> {
  @override
  Widget build(BuildContext context) {
    final loginController = Get.put<LoginController>(LoginController());
    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance
          .collection('users')
          .doc(widget.uid == null ? auth.currentUser!.uid : widget.uid)
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
            ? ImageNetwork(
                image: snapshot.data![FirestoreConstants.foto],
                imageCache: CachedNetworkImageProvider(FirestoreConstants.foto),
                height: MediaQuery.of(context).size.height * .05,
                width: MediaQuery.of(context).size.height * .05,
                duration: 1500,
                curve: Curves.easeIn,
                onPointer: true,
                debugPrint: false,
                fullScreen: false,
                fitAndroidIos: BoxFit.cover,
                fitWeb: BoxFitWeb.fill,
                borderRadius: BorderRadius.circular(70),
                onLoading: const CircularProgressIndicator(
                  color: Colors.indigoAccent,
                ),
                onError: Icon(
                  size: (MediaQuery.of(context).size.height * .05),
                  Icons.person,
                  color: Colors.grey,
                ),
                // onTap: () {
                //   debugPrint("Error de Texto");
                // },
              )
            : SizedBox.shrink();
      },
    );
  }
}
