import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../../../constants/custom_colors copy.dart';
import '../../../../../constants/firebase_auth_constants.dart';
import '../../../../../constants/firestore_constants.dart';
import '../../../../../models/messages_chat.dart';

class AbrirChatWidget extends StatelessWidget {
  const AbrirChatWidget({
    required BuildContext context,
    Key? key,
  }) : super(key: key);

  void startChat(
    var content,
    var groupChatId,
    var currentUserId,
    var peerId,
  ) {
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection(FirestoreConstants.supportChat)
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

  void abrirChat(BuildContext context) {
    TextEditingController _mensajesController =
        new TextEditingController(text: 'Hola');
    TextEditingController _uidController =
        new TextEditingController(text: 'K4osfi4Et3UzPFS7jHBsnEmyI1k2');
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

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: PlatformText('Abrir Chat'),
      onPressed: () {
        abrirChat(context);
      },
    );
  }
}
