import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants/firebase_auth_constants.dart';
import '../../../../../constants/firestore_constants.dart';
import '../../../../../controllers/chat/chat_controller copy.dart';
import '../../../../../controllers/chat/chat_controller.dart';
import '../../../../../models/user_chat.dart';
import '../../../../../utils/utilities.dart';
import '../../chat_page/chat_user_page.dart';

class UserChatInformationStreamWidget extends StatefulWidget {
  @override
  _UserChatInformationStreamWidgetState createState() =>
      _UserChatInformationStreamWidgetState();
}

class _UserChatInformationStreamWidgetState
    extends State<UserChatInformationStreamWidget> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection(FirestoreConstants.supportChat)
      // .doc()
      // .collection('')
      //     .where(
      //   FirestoreConstants.chattingWith,
      //   arrayContainsAny: [FirebaseAuth.instance.currentUser!.uid],
      // )
      .snapshots();

  @override
  Widget build(BuildContext context) {
    ChatController controller = Get.put(ChatController());

    // return Text('dddd');
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        return Text(snapshot.data!.docs.length.toString());
        // return ListView.builder(
        //   padding: EdgeInsets.all(10),
        //   itemBuilder: (context, index) {
        //     // print(snapshot.data?.docs[index].id);
        //     // return Text(snapshot.data!.docs[index].id.toString());
        //     // return Text('Test Información');
        //     return Obx(
        //       () => buildItem(
        //         context: context,
        //         document: snapshot.data!.docs[index],
        //         textSearch: controller.textSearch.value,
        //       ),
        //     );
        //   },
        //   itemCount: snapshot.data?.docs.length,
        //   controller: controller.listScrollController,
        // );
      },
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

              Get.lazyPut<ChatUserPageController>(
                () => ChatUserPageController(
                  peerData: userChat,
                ),
              );
              if (Utilities.isKeyboardShowing()) {
                Utilities.closeKeyboard(context);
              }
              Get.to(
                () => ChatUserPage(
                  peerId: userChat.id,
                  peerAvatar: userChat.foto,
                  peerNickName: userChat.nickname,
                ),
              );
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
                          child: Text(
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
                          child: Text(
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
