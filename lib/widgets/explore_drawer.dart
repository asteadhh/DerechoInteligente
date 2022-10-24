import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../controllers/LoginController/login_controller.dart';
import '../routes/app_pages.dart';
import '/screens/home_page.dart';
import 'package:flutter/material.dart';

import 'auth_dialog.dart';

class ExploreDrawer extends GetView<LoginController> {
  final LoginController controller =
      Get.put<LoginController>(LoginController());

  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).bottomAppBarColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              controller.userEmail == null
                  ? Container(
                      width: double.maxFinite,
                      child: TextButton(
                        // color: Colors.black,
                        // hoverColor: Colors.blueGrey[800],
                        // highlightColor: Colors.blueGrey[700],
                        style: TextButton.styleFrom(
                          primary: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AuthDialog(),
                          );
                        },
                        // shape: RoundedRectangleBorder(
                        //   borderRadius: BorderRadius.circular(15),
                        // ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 15.0,
                            bottom: 15.0,
                          ),
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        // CircleAvatar(
                        //   radius: 20,
                        //   backgroundImage:
                        //       imageUrl != null ? NetworkImage(imageUrl!) : null,
                        //   child: imageUrl == null
                        //       ? Icon(
                        //           Icons.account_circle,
                        //           size: 40,
                        //         )
                        //       : Container(),
                        // ),
                        // SizedBox(width: 10),
                        // Text(
                        //   name ?? userEmail!,
                        //   style: TextStyle(
                        //     fontSize: 20,
                        //     color: Colors.white70,
                        //   ),
                        // )
                      ],
                    ),
              SizedBox(height: 20),
              controller.userEmail != null
                  ? Container(
                      width: double.maxFinite,
                      child: TextButton(
                        // color: Colors.black,
                        // hoverColor: Colors.blueGrey[800],
                        // highlightColor: Colors.blueGrey[700],
                        style: TextButton.styleFrom(
                          primary: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: controller.isProcessing.value
                            ? null
                            : () async {
                                // setState(() {
                                controller.isProcessing.value = true;
                                // });
                                await controller.signOut().then((result) {
                                  print(result);
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      fullscreenDialog: true,
                                      builder: (context) => Home(),
                                    ),
                                  );
                                }).catchError((error) {
                                  print('Sign Out Error: $error');
                                });
                                // setState(() {
                                controller.isProcessing.value = false;
                                // });
                              },
                        // shape: RoundedRectangleBorder(
                        //   borderRadius: BorderRadius.circular(15),
                        // ),
                        child: Obx(
                          () => Padding(
                            padding: EdgeInsets.only(
                              top: 15.0,
                              bottom: 15.0,
                            ),
                            child: controller.isProcessing.value
                                ? CircularProgressIndicator()
                                : Text(
                                    'sign_out'.tr,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    )
                  : Container(),
              controller.userEmail != null ? SizedBox(height: 20) : Container(),
              InkWell(
                onTap: () {
                  Get.toNamed(AppPages.aboutUs);
                  // LandingPageBase()
                },
                child: Text(
                  'About Us',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Divider(
                  color: Colors.blueGrey[400],
                  thickness: 2,
                ),
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(AppPages.contactUS);
                },
                child: Text(
                  'Contact Us',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              AdministraccionEnableWidget(),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'Copyright © 2022 | PulPox SpA',
                    style: TextStyle(
                      color: Colors.blueGrey[300],
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AdministraccionEnableWidget extends StatelessWidget {
  const AdministraccionEnableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FirebaseAuth.instance.currentUser != null
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Divider(
                  color: Colors.blueGrey[400],
                  thickness: 2,
                ),
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(AppPages.platform);
                },
                child: Text(
                  'Administracción',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
            ],
          )
        : SizedBox.shrink();
  }
}
