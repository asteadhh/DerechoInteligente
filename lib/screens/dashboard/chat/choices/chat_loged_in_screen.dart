import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:get/get.dart';

import '../../../../constants/custom_colors copy.dart';
import '../../../../constants/firebase_auth_constants.dart';
import '../../../../constants/firestore_constants.dart';
import '../../../../controllers/chat/chat_controller copy.dart';
import '../../../../models/messages_chat.dart';
import '../../../../models/user_chat.dart';
import '../../content/chatSoporte/widget/loading_view.dart';

class ChatLogedInScreen extends GetView<ChatController> {
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

  void onSendMessage(
    String content,
    TextEditingController textController,
    TextEditingController uidController,
  ) {
    var groupChatId = '';
    // if (authController.currentUser!.uid.isNotEmpty == true) {
    //   authController.currentUser!.uid = authController.currentUser!.uid;
    // }
    if (authController.currentUser!.uid.hashCode <=
        uidController.text.hashCode) {
      groupChatId = '${authController.currentUser!.uid}-${uidController.text}';
    } else {
      groupChatId = '${uidController.text}-${authController.currentUser!.uid}';
    }
    if (content.trim().isNotEmpty) {
      print(textController.text);
      startChat(
        content,
        groupChatId,
        FirebaseAuth.instance.currentUser!.uid,
        uidController.text,
      );
      textController.clear();
      uidController.clear();
      // FirebaseFirestore.instance
      //     .collection('users')
      //     .doc(uidController.text)
      //     .update({
      //   FirestoreConstants.chattingWith:
      //       FieldValue.arrayUnion([authController.currentUser!.uid]),
      // });
    }
    // FirebaseFirestore.instance
    //     .collection('users')
    //     .doc(uidController.text)
    //     .update({
    //   FirestoreConstants.chattingWith:
    //       FieldValue.arrayUnion([authController.currentUser!.uid]),
    // });
  }

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

  @override
  Widget build(BuildContext context) {
    var chatDocId;
    var chatDocId2;

    Get.lazyPut(() => ChatController());
    void abrirChat() {
      TextEditingController _mensajesController =
          new TextEditingController(text: 'Hola');
      TextEditingController _uidController =
          new TextEditingController(text: 'xW1qaTcU7WeTTcZcDZU53L32RuW2');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          final uidField = TextFormField(
            controller: _uidController,
            // keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              hintText: 'uid',
              labelText: 'Ingresa el Uid',
              labelStyle: TextStyle(
                color: Colors.black,
              ),
              hintStyle: TextStyle(
                color: Colors.black,
              ),
            ),
          );
          final mensajeField = TextFormField(
            controller: _mensajesController,
            // keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              hintText: 'Mensaje',
              labelText: 'Ingresa aqui el mensaje',
              labelStyle: TextStyle(
                color: Colors.black,
              ),
              hintStyle: TextStyle(
                color: Colors.black,
              ),
            ),
          );

          return PlatformAlertDialog(
            content: Container(
              width: MediaQuery.of(context).size.width / 1.3,
              height: MediaQuery.of(context).size.height / 4,
              decoration: new BoxDecoration(
                shape: BoxShape.rectangle,
                color: const Color(0xFFFFFF),
                borderRadius: new BorderRadius.all(new Radius.circular(32.0)),
              ),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  uidField,
                  mensajeField,
                  PlatformDialogAction(
                    onPressed: () async {
                      onSendMessage(
                        _mensajesController.text,
                        _mensajesController,
                        // 'mimi3',
                        _uidController,
                      );
                      // await startChat(
                      //     context: context,
                      //     content: '',
                      //     textController: _mensajeController,
                      //     type: 0,
                      //     peerId: _uidController.text,
                      //     uidController: _uidController);
                      // await FirebaseAuth.instance.sendPasswordResetEmail(
                      //     email: _mensajeController.text);
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 12,
                      padding: EdgeInsets.all(15.0),
                      child: Material(
                        color: CustomColors.jurixNavy,
                        borderRadius: BorderRadius.circular(25.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            PlatformText(
                              'Enviar Mensaje',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                // fontFamily: 'helvetica_neue_light',
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      body: WillPopScope(
        onWillPop: () {
          return onBackPress(context);
        },
        child: SafeArea(
          child: Stack(
            children: <Widget>[
              SizedBox(
                height: 300,
                child: Column(
                  children: [
                    buildSearchBar(),
                    ElevatedButton(
                      child: PlatformText('Abrir Chat'),
                      onPressed: abrirChat,
                    ),
                    Obx(
                      () => PlatformText(controller.textSearch.value),
                    ),
                    // StreamBuilder<QuerySnapshot>(
                    //   stream: controller.usersStream,
                    //   builder: (BuildContext context,
                    //       AsyncSnapshot<QuerySnapshot> snapshot) {
                    //     if (snapshot.hasError) {
                    //       return PlatformText('Something went wrong');
                    //     }

                    //     if (snapshot.connectionState == ConnectionState.waiting) {
                    //       return PlatformText("Loading");
                    //     }

                    //     return ListView.builder(
                    //       padding: EdgeInsets.all(10),
                    //       itemBuilder: (context, index) {
                    //         // print(snapshot.data?.docs[index].id);
                    //         // return PlatformText('ddd');
                    //         return Obx(
                    //           () => buildItem(
                    //             context: context,
                    //             document: snapshot.data!.docs[index],
                    //             textSearch: controller.textSearch.value,
                    //           ),
                    //         );
                    //       },
                    //       itemCount: snapshot.data?.docs.length,
                    //       controller: controller.listScrollController,
                    //     );
                    //   },
                    // )
                  ],
                ),
              ),
              Positioned(
                child: controller.isLoading ? LoadingView() : SizedBox.shrink(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSearchBar() {
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
          StreamBuilder(
            stream: controller.btnClearController.stream,
            builder: (context, snapshot) {
              return snapshot.data == true
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

  Widget buildItem(
      {required BuildContext context,
      DocumentSnapshot? document,
      String? textSearch}) {
    if (document != null) {
      UserChatInfo userChat = UserChatInfo.fromDocument(document);
      if (userChat.id == authController.currentUser?.uid) {
        return SizedBox.shrink();
      }
      if (userChat.nickname
              .toLowerCase()
              .contains(textSearch.toString().toLowerCase())
          //     &&
          // userChat.id.contains(
          //   // controller.documents[1],
          // )
          ) {
        return Container(
          child: TextButton(
            onPressed: () {
//POSIBLE FIX//

              // Get.lazyPut<ChatUserPageController>(
              //   () => ChatUserPageController(
              //     peerData: userChat,
              //   ),
              // );
              // if (Utilities.isKeyboardShowing()) {
              //   Utilities.closeKeyboard(context);
              // }
              // Get.to(
              //   () => ChatUserPage(
              //     peerId: userChat.id,
              //     peerAvatar: userChat.foto,
              //     peerNickName: userChat.nickname,
              //   ),
              // );
            },
            child: Row(
              children: <Widget>[
                Material(
                  child: userChat.foto.isNotEmpty
                      ? Image.network(
                          userChat.foto,
                          fit: BoxFit.cover,
                          width: 50,
                          height: 50,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Container(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                color: Colors.grey,
                                value: loadingProgress.expectedTotalBytes !=
                                            null &&
                                        loadingProgress.cumulativeBytesLoaded !=
                                            null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                          errorBuilder: (context, Object, stackTrace) {
                            return Icon(
                              Icons.account_circle,
                              size: 50,
                              color: Colors.grey,
                            );
                          },
                        )
                      : Icon(
                          Icons.account_circle,
                          size: 50,
                          color: Colors.grey,
                        ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                  clipBehavior: Clip.hardEdge,
                ),
                Flexible(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: PlatformText(
                            '${userChat.nickname}',
                            maxLines: 1,
                            style: TextStyle(
                              // color: Colors.grey[600],
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.fromLTRB(10, 0, 0, 5),
                        ),
                        Container(
                          child: PlatformText(
                            '${userChat.aboutMe}',
                            maxLines: 1,
                            style: TextStyle(
                              color: Colors.grey[700],
                            ),
                          ),
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        ),
                      ],
                    ),
                    margin: EdgeInsets.only(left: 20),
                  ),
                ),
              ],
            ),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.grey.withOpacity(.2)),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          margin: EdgeInsets.only(
            bottom: 10,
            left: 5,
            right: 5,
          ),
        );
      } else {
        return SizedBox.shrink();
      }
      ;
    } else {
      return SizedBox.shrink();
    }
  }
}
