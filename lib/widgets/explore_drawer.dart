import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '/controllers/UserController/user_data_controller.dart';

import '../constants/firestore_constants.dart';
import '../controllers/LoginController/login_controller.dart';
import '../routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'auth_dialog/auth_dialog.dart';
import 'userInformation/User_Information.dart';

class ExploreDrawer extends StatefulWidget {
  @override
  State<ExploreDrawer> createState() => _ExploreDrawerState();
}

class _ExploreDrawerState extends State<ExploreDrawer> {
  final LoginController controller =
      Get.put<LoginController>(LoginController());

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    // controller.myUser!.foto;
    return Drawer(
      child: Container(
        color: Theme.of(context).bottomAppBarColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Login_information_Choice(),
              SizedBox(height: 40),
              // controller.userEmail != null ? SizedBox(height: 20) : Container(),
              InkWell(
                onTap: () {
                  Get.toNamed(AppPages.main);
                  // LandingPageBase()
                },
                child: Text(
                  'home'.tr,
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
                  Get.toNamed(AppPages.aboutUs);
                  // LandingPageBase()
                },
                child: Text(
                  'aboutUs'.tr,
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
                  'contactUs'.tr,
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
              //   child: Divider(
              //     color: Colors.blueGrey[400],
              //     thickness: 2,
              //   ),
              // ),
              // InkWell(
              //   onTap: () {
              //     Get.toNamed(AppPages.contactUS);
              //   },
              //   child: Text(
              //     'carreers'.tr,
              //     style: TextStyle(color: Colors.white, fontSize: 22),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Divider(
                  color: Colors.blueGrey[400],
                  thickness: 2,
                ),
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(AppPages.pagosScreen);
                },
                child: Text(
                  'payment'.tr,
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
              //   child: Divider(
              //     color: Colors.blueGrey[400],
              //     thickness: 2,
              //   ),
              // ),
              // InkWell(
              //   onTap: () {
              //     Get.toNamed(AppPages.contactUS);
              //   },
              //   child: Text(
              //     'cancellation'.tr,
              //     style: TextStyle(color: Colors.white, fontSize: 22),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Divider(
                  color: Colors.blueGrey[400],
                  thickness: 2,
                ),
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(AppPages.faq);
                },
                child: Text(
                  'faq'.tr,
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              AdministraccionEnableWidget(),
              Expanded(child: SizedBox.shrink()),
              UserLoginWidget(),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Divider(
                  color: Colors.blueGrey[400],
                  thickness: 2,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Copyright © 2022 | PulPox SpA',
                  style: TextStyle(
                    color: Colors.blueGrey[300],
                    fontSize: 14,
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

class Login_information_Choice extends StatelessWidget {
  const Login_information_Choice({
    Key? key,
  }) : super(key: key);
// datosUsuarioLogiado(auth.currentUser!.uid);
  @override
  Widget build(BuildContext context) {
    return FirebaseAuth.instance.currentUser != null
        ? Login_information()
        : SizedBox.shrink();
  }
}

class Login_information extends GetView<UserDataController> {
  Login_information({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 30,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(child: UserInformationDataAvatar()),
          SizedBox(
            width: MediaQuery.of(context).size.width * .02,
          ),
          Center(child: NameLandingUser())
        ],
      ),
    );
  }
}

class NameLandingUser extends StatefulWidget {
  const NameLandingUser({
    Key? key,
  }) : super(key: key);

  @override
  State<NameLandingUser> createState() => _NameLandingUserState();
}

class _NameLandingUserState extends State<NameLandingUser> {
  @override
  Widget build(BuildContext context) {
    final userController = Get.put<LoginController>(LoginController());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        Container(
          width: 180,
          child: UserInformationDataText(
            data: FirestoreConstants.nickname,
            fontSize: 10,
            color: Colors.white70,
            maxLines: 2,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        Container(
          width: 180,
          child: UserInformationDataText(
            data: FirestoreConstants.correo,
            fontSize: 10,
            color: Colors.white24,
            maxLines: 1,
          ),
        ),
      ],
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
                  'administration'.tr,
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
            ],
          )
        : SizedBox.shrink();
  }
}

class UserLoginWidget extends StatelessWidget {
  const UserLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FirebaseAuth.instance.currentUser != null
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
                LoginController().signOut();
              },
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(15),
              // ),
              child: Padding(
                padding: EdgeInsets.only(
                  top: 15.0,
                  bottom: 15.0,
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'sign_out'.tr,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    // CircleAvatar(
                    //   radius: 20,
                    //   backgroundImage: controller.myUser?.foto != null
                    //       ? NetworkImage(controller.myUser?.foto)
                    //       : null,
                    //   child: controller.myUser?.foto == null
                    //       ? Icon(
                    //           Icons.account_circle,
                    //           size: 40,
                    //         )
                    //       : Container(),
                    // ),
                    // SizedBox(width: 10),
                    // Text(
                    //   'dd',
                    //   //  LoginController().myUser?.nickname ??
                    //   //     LoginController().myUser?.correo!
                    //   style: TextStyle(
                    //     fontSize: 20,
                    //     color: Colors.white70,
                    //   ),
                    // )
                  ],
                ),
                // child: Text(
                //   'Sign Out',
                //   style: TextStyle(
                //     fontSize: 20,
                //     color: Colors.white,
                //   ),
                // ),
              ),
            ),
          )
        : Container(
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
                // setState(() {
                // controller.userEmail;
                // });
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
                  'sign_in'.tr,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
  }
}
