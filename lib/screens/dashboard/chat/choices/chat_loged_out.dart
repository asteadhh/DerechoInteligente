import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/custom_colors copy.dart';
import '../../../../routes/app_pages.dart';
import '../../../../widgets/buttons/filled_outline_button.dart';

class ChatLogedOutScreen extends StatelessWidget {
  const ChatLogedOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
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
          Center(
            heightFactor: 9,
            child: ElevatedButton(
              onPressed: () {
                // Get.offNamed(AppPages.signIn);
              },
              child: Text('Sign In'),
            ),
          )
        ],
      ),
    );
  }
}

AppBar buildAppBar() {
  return AppBar(
    automaticallyImplyLeading: false,
    elevation: 300,
    title: Text('Chats'.tr),
    centerTitle: false,
    actions: [
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.search),
      ),
      // IconButton(
      //   onPressed: () {
      //     openDialog();
      //   },
      //   icon: Icon(Icons.add),
      // ),
    ],
  );
}
