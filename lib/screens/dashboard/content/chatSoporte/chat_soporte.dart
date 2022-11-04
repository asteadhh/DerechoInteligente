import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants.dart';
import '../../../../controllers/chatSoporteController/chat_soporte_controller.dart';
import '../../../../responsive.dart';
import '../../chat/choices/chat_choices_screens.dart';
import 'widget/chat_soporte_screen.dart';

class ChatSoporteContent extends StatelessWidget {
  const ChatSoporteContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive.isMobile(context)
        ? Container(
            child: Text('ddd'),
          )
        : Row(
            children: [
              Expanded(
                flex: 3,
                child: ChatList(),
              ),
              // SizedBox(height: chatSoportePadding),
              Expanded(
                flex: 3,
                child: Column(children: [
                  ChatWidget(),
                ]),
              ),
              // SizedBox(height: chatSoportePadding),
              Expanded(
                flex: 2,
                child: UserInformation(),
              ),
            ],
          );
    //return Row(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     if (!Responsive.isMobile(context))
    //       Expanded(
    //         flex: 2,
    //         child: ChatList(),
    //       ),
    //     Expanded(
    //       flex: 3,
    //       child: Column(
    //         children: [
    //           if (Responsive.isMobile(context)) ChatList(),
    //           if (Responsive.isMobile(context))
    //             SizedBox(height: chatSoportePadding),
    //           ChatWidget(),
    //           SizedBox(height: chatSoportePadding),
    //           // RecentFiles(),
    //           if (Responsive.isMobile(context))
    //             SizedBox(height: chatSoportePadding),
    //           if (Responsive.isMobile(context)) UserInformation(),
    //         ],
    //       ),
    //     ),
    //     if (!Responsive.isMobile(context)) SizedBox(width: chatSoportePadding),
    //     // On Mobile means if the screen is less than 850 we dont want to show it
    //     if (!Responsive.isMobile(context))
    //       Expanded(
    //         flex: 2,
    //         child: UserInformation(),
    //       ),
    //   ],
    // );
  }
}

class UserInformation extends StatelessWidget {
  const UserInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
      child: Column(
        children: [
          Text('Informacion Basica Maestro'),
          SizedBox(
            height: 10,
          ),
          Text('Controlador Rating Maestro, y creditos'),
          SizedBox(
            height: 10,
          ),
          Text('Informacion Basica Usuario'),
          SizedBox(
            height: 10,
          ),
          Text('Informacion Ratting Usuario'),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class ChatList extends StatelessWidget {
  const ChatList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
      child: Column(
        children: [
          // Text('Aca Van los chats   '),
          // SizedBox(
          //   height: 20,
          // ),
          // Text('Ordenados por orden de tiempo y prioridad'),

          ChatChoiceScreen(),
        ],
      ),
    );
  }
}

class ChatWidget extends StatelessWidget {
  const ChatWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ChatSoporteController());
    return Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
      child: ChatSoporteScreen(),
      // child: Text('dddd'),
    );
  }
}
