import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../../constants/custom_colors copy.dart';
import '../../../../constants/firestore_constants.dart';
import '../../../../controllers/chatSoporteController/chat_soporte_controller.dart';
import '../../../../models/TypeMessage.dart';
import '../../../../models/messages_chat.dart';
import '../../content/chatSoporte/widget/loading_view.dart';
import '../chat_page/full_photo_page.dart';

class ChatSoporteScreen extends GetView<ChatSoporteController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Soporte'),
      ),
      body: Stack(children: [
        Column(
          children: [
            buildListMessage(),
            buildInput(context),
          ],
        ),
        GetBuilder<ChatSoporteController>(
          init: ChatSoporteController(),
          builder: (controller) => buildLoading(),
        ),
      ]),
    );
  }

//WIDGETS Send Message//

  void onSendMessage(String content, int type) {
    if (content.trim().isNotEmpty) {
      controller.textEditingController.clear();
      controller.sendMessage(
        content: content,
        type: type,
      );
      controller.listScrollController.animateTo(0,
          duration: Duration(microseconds: 300), curve: Curves.easeOut);
    }
  }

//WIDGETS Send Message//

  //UPLOAD IMAGE

  Future getImage({var type}) async {
    ImagePicker imagePicker = ImagePicker();
    PickedFile? pickedFile;

    pickedFile = await imagePicker.getImage(source: type);
    if (pickedFile != null) {
      controller.imageFile = File(pickedFile.path);
      if (controller.imageFile != null) {
        controller.isLoading = true;
        uploadFileF();
      }
    }
  }

  Future uploadFileF() async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    UploadTask uploadTask =
        controller.uploadFile(controller.imageFile!, fileName);
    try {
      TaskSnapshot snapshot = await uploadTask;
      controller.imageUrl = await snapshot.ref.getDownloadURL();
      controller.isLoading = false;
      onSendMessage(controller.imageUrl, TypeMessage.image);
      // controller.sendMessage(controller.imageUrl, type, groupChatId, currentUserId, peerId);
    } on FirebaseException catch (error) {
      controller.isLoading = false;
      Fluttertoast.showToast(msg: error.message ?? error.toString());
    }
  }
  //UPLOAD IMAGE

  Widget buildInput(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Material(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 7),
              child: IconButton(
                icon: Icon(Icons.camera_enhance),
                onPressed: () {
                  // showPlatformDialog(
                  //   context: context,
                  //   builder: (_) =>
                  AlertDialog(
                    title: Text('Alert'),
                    content: Text('Some content'),
                    actions: <Widget>[
                      ElevatedButton(
                        child: Text('Camara'),
                        onPressed: () async {
                          await getImage(type: ImageSource.camera);
                          Navigator.pop(context);
                        },
                      ),
                      ElevatedButton(
                        child: Text('Galeria'),
                        onPressed: () async {
                          await getImage(type: ImageSource.gallery);
                          Navigator.pop(context);
                        },
                      ),
                    ],
                    // ),
                  );
                },
                color: CustomColors.jurixNavy,
              ),
            ),
            color: Colors.white,
          ),
          Flexible(
            child: Container(
              child: TextField(
                onSubmitted: (value) {
                  onSendMessage(
                      controller.textEditingController.text, TypeMessage.text);
                },
                style: TextStyle(color: CustomColors.jurixNavy, fontSize: 15),
                controller: controller.textEditingController,
                decoration: InputDecoration.collapsed(
                  hintText: 'Type your message...',
                  hintStyle: TextStyle(
                    color: CustomColors.kBlack,
                  ),
                ),
                focusNode: controller.focusNode,
              ),
            ),
          ),
          Material(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: IconButton(
                icon: Icon(Icons.send),
                onPressed: () => onSendMessage(
                    controller.textEditingController.text, TypeMessage.text),
                color: CustomColors.jurixNavy,
              ),
            ),
            color: Colors.white,
          ),
        ],
      ),
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(color: CustomColors.jurixGris, width: 0.5)),
          color: Colors.white),
    );
  }

//WIDGETS Send Mesasge//

  //WIDGETS STREAM CHAT//

  Widget buildListMessage() {
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
        .collection('supportChat')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection(FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
    return Flexible(
      child: StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
          controller.listMessage.addAll(snapshot.data!.docs);
          return ListView.builder(
            padding: EdgeInsets.all(10),
            itemCount: snapshot.data?.docs.length,
            reverse: true,
            controller: controller.listScrollController,
            itemBuilder: (context, index) {
              return buildItem(index, snapshot.data?.docs[index]);
            },
          );
        },
      ),
    );
  }

  Widget buildItem(int index, DocumentSnapshot? document) {
    if (document != null) {
      MessageChat messageChat = MessageChat.fromDocument(document);
      if (messageChat.idFrom == FirebaseAuth.instance.currentUser!.uid) {
        return Row(
          children: [
            messageChat.type == '0'
                ? Container(
                    child: Text(
                      messageChat.content,
                      style: TextStyle(color: CustomColors.jurixNavy),
                    ),
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                    width: 200,
                    decoration: BoxDecoration(
                      color: CustomColors.kGrey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    margin: EdgeInsets.only(
                      bottom: isLastMessageRight(index) ? 20 : 10,
                      right: 10,
                    ),
                  )
                : messageChat.type == '1'
                    ? Container(
                        child: OutlinedButton(
                          onPressed: () {
                            Get.to(
                              () => FullPhotoPage(url: messageChat.content),
                            );
                          },
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.all(0))),
                          child: Material(
                            child: Image.network(
                              messageChat.content,
                              loadingBuilder:
                                  ((context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Container(
                                  width: 200,
                                  height: 200,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                        color: CustomColors.jurixNavy,
                                        value: loadingProgress
                                                        .expectedTotalBytes !=
                                                    null &&
                                                loadingProgress
                                                        .cumulativeBytesLoaded !=
                                                    null
                                            ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                loadingProgress
                                                    .expectedTotalBytes!
                                            : null),
                                  ),
                                  decoration: BoxDecoration(
                                    color: CustomColors.jurixGris,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                );
                              }),
                              errorBuilder: (context, error, stackTrace) {
                                return Material(
                                  child: Image.asset(
                                      'images/img_not_available.jpeg',
                                      width: 200,
                                      height: 200,
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                  clipBehavior: Clip.hardEdge,
                                );
                              },
                              width: 200,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            clipBehavior: Clip.hardEdge,
                          ),
                        ),
                        margin: EdgeInsets.only(left: 10),
                        // margin: EdgeInsets.only(
                        //     bottom: isLastMessageRight(index) ? 20 : 10,
                        //     right: 10),
                      )
                    : Container(
                        child: Image.asset(
                          'images/${messageChat.content}.gif',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        margin: EdgeInsets.only(
                          bottom: isLastMessageRight(index) ? 20 : 10,
                          right: 10,
                        ),
                      ),
          ],
          mainAxisAlignment: MainAxisAlignment.end,
        );
      } else {
        return Container(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  isLastMessageLeft(index)
                      ? Material(
                          child: Image.network(
                            CustomColors.suportFoto,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                    color: CustomColors.jurixNavy,
                                    value: loadingProgress.expectedTotalBytes !=
                                                null &&
                                            loadingProgress
                                                    .cumulativeBytesLoaded !=
                                                null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(
                                Icons.account_circle,
                                size: 35,
                                color: CustomColors.kGrey,
                              );
                            },
                            width: 35,
                            height: 35,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(18),
                          ),
                          clipBehavior: Clip.hardEdge,
                        )
                      : Container(
                          width: 35,
                        ),
                  messageChat.type == '0'
                      ? Container(
                          child: Text(
                            messageChat.content,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                          width: 200,
                          margin: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                              color: CustomColors.jurixNavy,
                              borderRadius: BorderRadius.circular(8)),
                        )
                      : messageChat.type == '1'
                          ? Container(
                              child: TextButton(
                                onPressed: () {
                                  Get.to(
                                    () =>
                                        FullPhotoPage(url: messageChat.content),
                                  );
                                },
                                style: ButtonStyle(
                                    padding:
                                        MaterialStateProperty.all<EdgeInsets>(
                                            EdgeInsets.all(0))),
                                child: Material(
                                  child: Image.network(
                                    messageChat.content,
                                    loadingBuilder:
                                        ((context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Container(
                                        width: 200,
                                        height: 200,
                                        child: Center(
                                          child: CircularProgressIndicator(
                                              color: CustomColors.jurixNavy,
                                              value: loadingProgress
                                                              .expectedTotalBytes !=
                                                          null &&
                                                      loadingProgress
                                                              .cumulativeBytesLoaded !=
                                                          null
                                                  ? loadingProgress
                                                          .cumulativeBytesLoaded /
                                                      loadingProgress
                                                          .expectedTotalBytes!
                                                  : null),
                                        ),
                                        decoration: BoxDecoration(
                                          color: CustomColors.jurixGris,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(8),
                                          ),
                                        ),
                                      );
                                    }),
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            Material(
                                      clipBehavior: Clip.hardEdge,
                                      child: Image.asset(
                                        'images/img_not_available.jpeg',
                                        width: 200,
                                        height: 200,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    width: 200,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                  clipBehavior: Clip.hardEdge,
                                ),
                              ),
                              margin: EdgeInsets.only(
                                  bottom: isLastMessageRight(index) ? 20 : 10,
                                  right: 10),
                            )
                          : Container(
                              child: Image.asset(
                                'images/${messageChat.content}.gif',
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                  isLastMessageLeft(index)
                      ? Container(
                          margin: EdgeInsets.only(left: 50, top: 5, bottom: 5),
                          child: Text(
                            DateFormat('dd MMM yyyy, hh:mm a').format(
                              DateTime.fromMillisecondsSinceEpoch(
                                int.parse(messageChat.timeStamp),
                              ),
                            ),
                            style: TextStyle(
                              color: CustomColors.kGrey,
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ],
          ),
          margin: EdgeInsets.only(bottom: 10),
        );
      }
    } else {
      return SizedBox.shrink();
    }
  }

  bool isLastMessageLeft(int index) {
    if ((index > 0 &&
            controller.listMessage[index - 1].get(FirestoreConstants.idFrom) ==
                FirebaseAuth.instance.currentUser!.uid) ||
        index == 0) {
      return true;
    } else {
      return false;
    }
  }

  bool isLastMessageRight(int index) {
    if ((index > 0 &&
            controller.listMessage[index - 1].get(FirestoreConstants.idFrom) !=
                FirebaseAuth.instance.currentUser!.uid) ||
        index == 0) {
      return true;
    } else {
      return false;
    }
  }
  //WIDGETS STREAM CHAT//
  //WIDGETS Build Loading//

  Widget buildLoading() {
    return Positioned(
      child: controller.isLoading ? LoadingView() : SizedBox.shrink(),
    );
  }
  //WIDGETS Build Loading//
}
