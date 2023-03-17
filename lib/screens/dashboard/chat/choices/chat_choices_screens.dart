import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:get/get.dart';

import '../../../../constants/custom_colors copy.dart';
import '../../../../constants/firebase_auth_constants.dart';
import '../../../../constants/firestore_constants.dart';
import '../../../../controllers/chat/chat_controller copy.dart';
import '../../../../models/messages_chat.dart';
import '../../content/chatSoporte/widget/loading_view.dart';
import 'widgets/AbrirChatWidget.dart';
import 'widgets/UserChatInformationWidget.dart';

class ChatChoiceScreen extends GetView<ChatController> {
  const ChatChoiceScreen({Key? key}) : super(key: key);

  //
  Future<bool> onBackPress(BuildContext context) {
    openDialogBackup(context);
    return Future.value(false);
  }

  Future<void> openDialogBackup(BuildContext context) async {
    switch (await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          clipBehavior: Clip.hardEdge,
          contentPadding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              color: CustomColors.jurixNavy,
              padding: EdgeInsets.only(bottom: 10, top: 10),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Icon(
                      Icons.exit_to_app,
                      size: 30,
                      color: Colors.white,
                    ),
                    margin: EdgeInsets.only(bottom: 10),
                  ),
                  PlatformText(
                    'Salir de la app',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  PlatformText(
                    'Estas Seguro que quieres Salir de la Aplicacción?',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  )
                ],
                mainAxisSize: MainAxisSize.min,
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 0);
              },
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                      right: 10,
                    ),
                    child: Icon(
                      Icons.cancel,
                      color: CustomColors.kBlue,
                    ),
                  ),
                  PlatformText(
                    'Cancel',
                    style: TextStyle(
                        color: CustomColors.kBlue, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 1);
              },
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                      right: 10,
                    ),
                    child: Icon(
                      Icons.check_circle,
                      color: CustomColors.kBlue,
                    ),
                  ),
                  PlatformText(
                    'Yes',
                    style: TextStyle(
                        color: CustomColors.kBlue, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        );
      },
    )) {
      case 0:
        break;
      case 1:
        exit(0);
    }
  }

  //

  @override
  Widget build(BuildContext context) {
    return ChatLogedIn();
  }
}

class ChatLogedIn extends GetView<ChatController> {
  const ChatLogedIn({
    Key? key,
    // required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void startChat(
      var content,
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
        type: '0',
      );
      FirebaseFirestore.instance.runTransaction((transaction) async {
        await transaction.set(
          documentReference,
          messageChat.toJson(),
        );
        FirebaseFirestore.instance.collection('users').doc(peerId).update({
          FirestoreConstants.chattingWith:
              FieldValue.arrayUnion([authController.currentUser!.uid]),
        }).then((value) {
          FirebaseFirestore.instance
              .collection('users')
              .doc(authController.currentUser!.uid)
              .update({
            FirestoreConstants.chattingWith: FieldValue.arrayUnion([peerId]),
          });
        });
      });
    }

//BUILD Chat
    Get.lazyPut(() => ChatController());
    return SafeArea(
      child: Stack(
        children: [
          Column(
            children: [
              // PlatformText('data'),
              BuildSearchBarWidget(),
              AbrirChatWidget(
                context: context,
              ),
              // UserChatInformationWidget(),
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                child: UserChatInformationStreamWidget(),
                // child: PlatformText('Tu Cara'),
              ),
            ],
          ),
          Positioned(
            child: controller.isLoading ? LoadingView() : SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

class BuildSearchBarWidget extends GetView<ChatController> {
  const BuildSearchBarWidget({
    Key? key,
    // required this.controller,
  }) : super(key: key);

  // final ChatController controller;

  @override
  Widget build(BuildContext context) {
    // Get.lazyPut(() => ChatController());
    return Container(
      height: 40,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.search,
            size: 20,
            color: Colors.grey,
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: TextFormField(
              textInputAction: TextInputAction.search,
              controller: controller.searchBarTec,
              style: TextStyle(fontSize: 13),
              decoration: InputDecoration.collapsed(
                hintText: 'Busca aqui ...',
                hintStyle: TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                ),
              ),
              onChanged: (value) {
                if (value.isNotEmpty) {
                  controller.btnClearController.add(true);
                  // setState(() {
                  controller.textSearch.value = value;
                  // print(value);
                  // print(controller.textSearch.value);
                  // });
                } else {
                  controller.btnClearController.add(false);
                  // setState(() {
                  controller.textSearch.value = '';
                  // });
                }
              },
            ),
          ),
//

          Obx(
            () {
              return controller.textSearch.value != ''
                  ? GestureDetector(
                      onTap: () {
                        controller.searchBarTec.clear();
                        controller.btnClearController.add(false);
                        // setState(() {
                        controller.textSearch.value = '';
                        // });
                      },
                      child: Icon(
                        Icons.clear_rounded,
                        color: Colors.grey,
                        size: 20,
                      ),
                    )
                  : SizedBox.shrink();
            },
          )

          //
          // StreamBuilder(
          //   stream: controller.btnClearController.stream,
          //   builder: (context, snapshot) {
          //     return
          //snapshot.data == true
          //         ? GestureDetector(
          //             onTap: () {
          //               controller.searchBarTec.clear();
          //               controller.btnClearController.add(false);
          //               // setState(() {
          //               controller.textSearch.value = '';
          //               // });
          //             },
          //             child: Icon(
          //               Icons.clear_rounded,
          //               color: Colors.grey,
          //               size: 20,
          //             ),
          //           )
          //         : SizedBox.shrink();
          //   },
          // ),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
      margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
    );
  }
}
