import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:get/get.dart';
import '/controllers/LoginController/login_controller.dart';

import '../base/home_page_landing.dart';

class AboutUsScreen extends GetView<LoginController> {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put<LoginController>(LoginController());
    return LandingPageBase(
      widget: Column(
        children: [
          Container(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/images/cover.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          // PlatformText('Imprimir Correo en'),

          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                PlatformText('aboutUsText1'.tr),
                SizedBox(
                  height: 20,
                ),
                PlatformText('aboutUsText2'.tr),
                SizedBox(
                  height: 20,
                ),
                PlatformText('aboutUsText3'.tr),
              ],
            ),
          )
          // ElevatedButton(
          //   onPressed: () {
          //     print(controller.myUser?.correo);
          //   },
          //   child: PlatformText('Imprimir Correo en Stream'),
          // ),
          // SizedBox(
          //   height: 20,
          // ),
          // ElevatedButton(
          //   onPressed: () {
          //     print(FirebaseAuth.instance.currentUser!.email);
          //   },
          //   child: PlatformText('Imprimir Correo en Firebase'),
          // )
        ],
      ),
    );
  }
}
