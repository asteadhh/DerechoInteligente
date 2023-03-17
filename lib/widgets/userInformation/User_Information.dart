import 'package:auto_size_text/auto_size_text.dart';
import 'package:avatar_view/avatar_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:get/get.dart';
import '/constants/firebase_auth_constants.dart';
import '/constants/firestore_constants.dart';

import '../../controllers/LoginController/login_controller.dart';

// ignore: must_be_immutable
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

  double fontSize;
  var color;
  var maxLines;
  var overflow;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance
          .collection('users')
          .doc(uid == null ? auth.currentUser!.uid : uid)
          .get(),
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError)
          return Center(
            child: PlatformText(snapshot.hasError.toString()),
          );

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

// ignore: must_be_immutable
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
    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance
          .collection('users')
          .doc(widget.uid == null ? auth.currentUser!.uid : widget.uid)
          .get(),
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError)
          return Center(
            child: PlatformText(snapshot.hasError.toString()),
          );

        return snapshot.hasData
            ? AvatarView(
                radius: 20,
                // borderWidth: 8,
                // borderColor: Colors.yellow,
                avatarType: AvatarType.CIRCLE,
                backgroundColor: Colors.white,
                imagePath: snapshot.data![FirestoreConstants.foto],
                placeHolder: Container(
                  child: Icon(
                    Icons.person,
                    size: 50,
                  ),
                ),
                errorWidget: Container(
                  child: Icon(
                    Icons.error,
                    size: 50,
                  ),
                ),
              )
            : SizedBox.shrink();
      },
    );
  }
}
