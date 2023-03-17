import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:get/get.dart';

import 'package:async/async.dart' show StreamGroup;
//replace

// import '../../../constants/firebase_auth_constants.dart';
import '../../../../constants/custom_colors copy.dart';
import '../../../../constants/firebase_auth_constants.dart';
import '../../../../widgets/buttons/filled_outline_button.dart';
import '../chat_detail_screen.dart';
import 'chat_card.dart';

class ChatHomeBody extends StatelessWidget {
  ChatHomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var messageDatabase = firebaseFirestore
    //     .collection('chats')
    //     .doc(auth.currentUser?.uid)
    //     .collection('messages');
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(
            CustomColors.kDefaultPadding,
            0,
            CustomColors.kDefaultPadding,
            CustomColors.kDefaultPadding,
          ),
          child: Row(
            children: [
              FillOutlineButton(
                press: () {},
                text: 'recent_messages'.tr,
              ),
              SizedBox(
                width: CustomColors.kDefaultPadding,
              ),
              FillOutlineButton(
                press: () {},
                text: 'history'.tr,
                isFilled: false,
              ),
            ],
          ),
        ),
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
            //CHATS THAT ARE DISPLAYED
            stream: StreamGroup.merge(
              [
                // firebaseFirestore
                //     .collection('chats')
                //     .where(
                //       'sendTo',
                //       isEqualTo: auth.currentUser!.uid,
                //       // 'started': currentUserID,
                //     )
                //     .snapshots(),
                // firebaseFirestore
                //     .collection('chats')
                //     .where(
                //       'started',
                //       isEqualTo: auth.currentUser!.uid,
                //       // 'started': currentUserID,
                //     )
                //     .snapshots(),
                firebaseFirestore
                    .collection('users')
                    .doc(auth.currentUser!.uid)
                    .collection('chats')
                    // .where(
                    //   'started',
                    //   isEqualTo: auth.currentUser!.uid,
                    //   // 'started': currentUserID,
                    // )
                    .snapshots(),
              ],
            ),
            // stream: firebaseFirestore
            //     .collection('chats')
            //     // .doc(authController.currentUser?.uid)
            //     // .collection('messages')
            //     .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              // var d = snapshot;
              if (snapshot.hasError) {
                return PlatformText('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return PlatformText("Loading");
              }
              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  var chatId = document.id;

                  /// ID SEGUNDO CHAT

                  // var chatId2;
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;

                  return ChatCard(
                    chatId: chatId,
                    uid: (() {
                      if (data['started'] == auth.currentUser!.uid) {
                        return data['sendTo'];
                      } else if (data['sendTo'] == auth.currentUser!.uid) {
                        return data['started'];
                      }
                    })(),
                    press: () {
                      // print(data['mirrorChatId']);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatDetail(
                            chatId2: data['mirrorChatId'],
                            chatId: chatId,
                            friendUid: (() {
                              if (data['started'] == auth.currentUser!.uid) {
                                return data['sendTo'];
                              } else if (data['sendTo'] ==
                                  auth.currentUser!.uid) {
                                return data['started'];
                              }
                            })(),
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              );
            },
          ),
        ),
      ],
    );
  }
}
