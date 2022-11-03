import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../constants/firebase_auth_constants.dart';

class NewMessage extends StatefulWidget {
  final uid;
  final chatId;
  final chatId2;

  NewMessage({
    Key? key,
    this.uid,
    this.chatId,
    this.chatId2,
  }) : super(key: key);

  // NewMessage(th);
  @override
  State<NewMessage> createState() => _NewMessageState(
        uid,
        chatId,
        chatId2,
      );
}

class _NewMessageState extends State<NewMessage> {
  // var uid;
  _NewMessageState(
    this.uid,
    this.chatId,
    this.chatId2,
  );
  final _controller = new TextEditingController();
  // NewMessagesController controller = Get.put(NewMessagesController());
  var uid;
  var chatId;
  var chatId2;

  var _enteredMessage = '';
  void _sendMessage() {
    FocusScope.of(context).unfocus();
    firebaseFirestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .add({
      'message': _enteredMessage,
      'createdTime': Timestamp.now(),
      'userId': auth.currentUser!.uid,
      'seen': false,
      'delivered': false,
    }).then((value) {
      firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('chats')
          .doc(chatId2)
          .collection('messages')
          .add({
        'message': _enteredMessage,
        'createdTime': Timestamp.now(),
        'userId': auth.currentUser!.uid,
        'seen': false,
        'delivered': false,
      });
    });
    print(uid);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(10),
      // ),
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Enviar Mensaje',
                  contentPadding: EdgeInsets.all(12),
                ),
                onChanged: (context) {
                  setState(() {
                    _enteredMessage = context;
                  });
                },
              ),
            ),
          ),
          IconButton(
            onPressed: _enteredMessage.trim().isEmpty ? null : _sendMessage,
            icon: Icon(
              Icons.send,
            ),
          ),
        ],
      ),
    );
  }
}
