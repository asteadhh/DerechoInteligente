import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sticky_grouped_list/sticky_grouped_list.dart';

import '../../../constants/custom_colors copy.dart';
import '../../../constants/firebase_auth_constants.dart';

class ChatMessages extends StatelessWidget {
  ChatMessages({
    Key? key,
    this.fiendUid,
    this.chatId,
  }) : super(key: key);
  final fiendUid;
  final chatId;

  @override
  Widget build(BuildContext context) {
    var messageDatabase = firebaseFirestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('createdTime', descending: true)
        .snapshots();
    return StreamBuilder(
      stream: messageDatabase,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        final documents = snapshot.data!.docs;
        // return Text(chatId['message']);
        // return ListView(
        //   children: snapshot.data!.docs.map((DocumentSnapshot document) {
        //     Map<String, dynamic> data =
        //         document.data()! as Map<String, dynamic>;
        //     return ListTile(
        //       title: Text(data['message']),
        //       // subtitle: Text(data['company']),
        //     );
        //   }).toList(),
        // );
        return StickyGroupedListView(
          floatingHeader: true,
          elements: documents,
          groupBy: (dynamic element) {
            return DateTime(
              DateTime.parse(
                element['createdTime'].toDate().toString(),
              ).year,
              DateTime.parse(
                element['createdTime'].toDate().toString(),
              ).month,
              DateTime.parse(
                element['createdTime'].toDate().toString(),
              ).day,
            );
          },
          groupSeparatorBuilder: (dynamic element) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * .05,
              child: Center(
                child: Card(
                  color: CustomColors.jurixNavy,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      // DateFormat.yMMMMd().format(element['createdTime']),
                      DateFormat.yMMMMd().format(
                        DateTime.parse(
                          element['createdTime'].toDate().toString(),
                        ),
                      ),
                      style: TextStyle(color: CustomColors.jurixWhite),
                    ),
                  ),
                ),
              ),
            );
          },
          reverse: true,
          order: StickyGroupedListOrder.DESC,
          indexedItemBuilder: (context, streamSnapshot, int index) {
            return Align(
              alignment: documents[index]['userId'] == auth.currentUser?.uid
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Card(
                elevation: 8,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(documents[index]['message']),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
