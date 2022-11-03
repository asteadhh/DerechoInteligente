import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../constants/custom_colors copy.dart';
import '../../../../constants/firebase_auth_constants.dart';

class ChatCard extends StatelessWidget {
  ChatCard({
    Key? key,
    required this.uid,
    required this.chatId,
    required this.press,
  }) : super(key: key);

  final uid;
  final chatId;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: firebaseFirestore.collection('users').doc(uid).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text('');
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return InkWell(
            onTap: press,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: CustomColors.kDefaultPadding,
                vertical: CustomColors.kDefaultPadding * 0.75,
              ),
              child: Row(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundImage: NetworkImage(data['foto']),
                      ),
                      if (data['status'] == 'Available')
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            height: 16,
                            width: 16,
                            decoration: BoxDecoration(
                              color: CustomColors.kPrimaryColor,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                width: 3,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        // vertical: CustomColors.kDefaultPadding,
                        horizontal: CustomColors.kDefaultPadding * .75,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Text(chatId),
                          Text(
                            data['nombre'].toString(),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          // Opacity(
                          //   opacity: 0.64,
                          //   child: Text(
                          //     chat['lastMessage'],
                          //     maxLines: 1,
                          //     overflow: TextOverflow.ellipsis,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                  // Opacity(
                  //   opacity: 0.64,
                  //   child: Text(chat['time']),
                  // ),
                ],
              ),
            ),
          );
        }

        return Text("loading");
      },
    );
  }
}
