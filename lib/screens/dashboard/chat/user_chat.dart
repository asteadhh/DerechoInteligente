import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'home_components/new_messages.dart';
import 'messages.dart';

class UserChat extends StatelessWidget {
  final friendUid;
  final chatId;
  final chatId2;

  // var name;
  UserChat(
      {Key? key,
      required this.friendUid,
      required this.chatId,
      required this.chatId2})
      : super(
          key: key,
        );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder<DocumentSnapshot>(
          future: FirebaseFirestore.instance
              .collection('users')
              .doc(friendUid)
              .get(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text("Something went wrong");
            }

            if (snapshot.hasData && !snapshot.data!.exists) {
              return Text("Document does not exist");
            }

            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;
              return Row(
                children: [
                  CircleAvatar(
                    radius: 20, // Image radius
                    backgroundImage: NetworkImage(data['foto']),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  // Text(chatId),
                  Container(
                    width: MediaQuery.of(context).size.width * .6,
                    child: FittedBox(
                      fit: BoxFit.fitHeight,
                      // alignment: ,
                      child: Text(
                        data['nombre'].toString(),
                      ),
                    ),
                  ),
                ],
              );
            }

            return Text("loading");
          },
        ),

        // title: Text('data'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ChatMessages(
                chatId: chatId,
                fiendUid: friendUid,
              ),
            ),
            NewMessage(
              uid: friendUid,
              chatId: chatId,
              chatId2: chatId2,
              // friendUid,
              // chatId,
            ),
          ],
        ),
      ),
    );
  }
}
