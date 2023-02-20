import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../constants/custom_colors.dart';
import '../constants/theme.dart';
import '/controllers/LoginController/login_controller.dart';

import '../routes/app_pages.dart';
import 'auth_dialog/auth_dialog.dart';
import 'package:flutter/material.dart';

import 'platformButtons/profileLoginButtons.dart';

class TopBarContents extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    final LoginController controller =
        Get.put<LoginController>(LoginController());
    var screenSize = MediaQuery.of(context).size;

    return PreferredSize(
      preferredSize: Size(screenSize.width, 1000),
      child: Container(
        // color: Theme.of(context).bottomAppBarColor.withOpacity(0),
        color: Constants.derechoInteligenteIndigoDye,
        child: Padding(
          // padding: EdgeInsets.all(20),
          padding: EdgeInsets.only(bottom: 5, left: 5, right: 5, top: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FittedBox(
                fit: BoxFit.fitWidth,
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(AppPages.main);
                  },
                  child: Row(
                    children: [
                      LogoDerechoInteligente(),
                      Text(
                        'Derecho Inteligente',
                        style: TextStyle(
                          color: Colors.blueGrey[100],
                          fontSize: 20,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // SizedBox(width: screenSize.width / 10),
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: InkWell(
                        onHover: (value) {
                          // setState(() {
                          value
                              ? controller.isHovering[6] = true
                              : controller.isHovering[6] = false;
                          // });
                        },
                        onTap: () {
                          Get.toNamed(AppPages.work);
                        },
                        child: Obx(
                          () => Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'work'.tr,
                                style: TextStyle(
                                  color: controller.isHovering[6]
                                      ? Colors.blue[200]
                                      : Colors.white,
                                ),
                              ),
                              SizedBox(height: 5),
                              Visibility(
                                maintainAnimation: true,
                                maintainState: true,
                                maintainSize: true,
                                visible: controller.isHovering[6],
                                child: Container(
                                  height: 2,
                                  width: 20,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: screenSize.width / 40),
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: InkWell(
                        onHover: (value) {
                          // setState(() {
                          value
                              ? controller.isHovering[0] = true
                              : controller.isHovering[0] = false;
                          // });
                        },
                        onTap: () {
                          Get.toNamed(AppPages.aboutUs);
                        },
                        child: Obx(
                          () => Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'aboutUs'.tr,
                                style: TextStyle(
                                  color: controller.isHovering[0]
                                      ? Colors.blue[200]
                                      : Colors.white,
                                ),
                              ),
                              SizedBox(height: 5),
                              Visibility(
                                maintainAnimation: true,
                                maintainState: true,
                                maintainSize: true,
                                visible: controller.isHovering[0],
                                child: Container(
                                  height: 2,
                                  width: 20,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: screenSize.width / 40),
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: InkWell(
                        onHover: (value) {
                          // setState(() {
                          value
                              ? controller.isHovering[1] = true
                              : controller.isHovering[1] = false;
                          // });
                        },
                        onTap: () {
                          Get.toNamed(AppPages.contactUS);
                        },
                        child: Obx(
                          () => Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'contactUs'.tr,
                                style: TextStyle(
                                  color: controller.isHovering[1]
                                      ? Colors.blue[200]
                                      : Colors.white,
                                ),
                              ),
                              SizedBox(height: 5),
                              Visibility(
                                maintainAnimation: true,
                                maintainState: true,
                                maintainSize: true,
                                visible: controller.isHovering[1],
                                child: Container(
                                  height: 2,
                                  width: 20,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: screenSize.width / 40),
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: InkWell(
                        onHover: (value) {
                          // setState(() {
                          value
                              ? controller.isHovering[2] = true
                              : controller.isHovering[2] = false;
                          // });
                        },
                        onTap: () {
                          Get.toNamed(AppPages.pagosScreen);
                        },
                        child: Obx(
                          () => Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'payment'.tr,
                                style: TextStyle(
                                  color: controller.isHovering[2]
                                      ? Colors.blue[200]
                                      : Colors.white,
                                ),
                              ),
                              SizedBox(height: 5),
                              Visibility(
                                maintainAnimation: true,
                                maintainState: true,
                                maintainSize: true,
                                visible: controller.isHovering[2],
                                child: Container(
                                  height: 2,
                                  width: 20,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: screenSize.width / 40),
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: InkWell(
                        onHover: (value) {
                          // setState(() {
                          value
                              ? controller.isHovering[3] = true
                              : controller.isHovering[3] = false;
                          // });
                        },
                        onTap: () {
                          Get.toNamed(AppPages.faq);
                        },
                        child: Obx(
                          () => Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'faq'.tr,
                                style: TextStyle(
                                  color: controller.isHovering[3]
                                      ? Colors.blue[200]
                                      : Colors.white,
                                ),
                              ),
                              SizedBox(height: 5),
                              Visibility(
                                maintainAnimation: true,
                                maintainState: true,
                                maintainSize: true,
                                visible: controller.isHovering[3],
                                child: Container(
                                  height: 2,
                                  width: 20,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    FirebaseAuth.instance.currentUser != null
                        ? Row(
                            children: [
                              SizedBox(width: screenSize.width / 40),
                              FittedBox(
                                fit: BoxFit.fitWidth,
                                child: InkWell(
                                  onHover: (value) {
                                    // setState(() {
                                    value
                                        ? controller.isHovering[4] = true
                                        : controller.isHovering[4] = false;
                                    // });
                                  },
                                  onTap: () {
                                    Get.toNamed(AppPages.platform);
                                  },
                                  child: Obx(
                                    () => Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'administration'.tr,
                                          style: TextStyle(
                                            color: controller.isHovering[4]
                                                ? Colors.blue[200]
                                                : Colors.white,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Visibility(
                                          maintainAnimation: true,
                                          maintainState: true,
                                          maintainSize: true,
                                          visible: controller.isHovering[4],
                                          child: Container(
                                            height: 2,
                                            width: 20,
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : SizedBox.shrink(),

                    SizedBox(width: screenSize.width / 40),
                  ],
                ),
              ),
              // SizedBox(width: screenSize.width / 40),
              //NO///
              // IconButton(
              //   icon: Icon(Icons.brightness_6),
              //   splashColor: Colors.transparent,
              //   highlightColor: Colors.transparent,
              //   color: Colors.white,
              //   onPressed: () {
              //     //Change Theme Mode
              //     // EasyDynamicTheme.of(context).changeTheme();
              //     Get.changeThemeMode(ThemeService().loadThemeFromBox()
              //         ? ThemeMode.light
              //         : ThemeMode.dark);
              //     ThemeService()
              //         .saveThemeToBox(!ThemeService().loadThemeFromBox());
              //   },
              // ),

              //NO///
              SizedBox(width: screenSize.width / 40),
              IconButton(
                icon: 'idioma'.tr == 'Español'
                    ? SvgPicture.asset('icons/flags/svg/cl.svg',
                        package: 'country_icons')
                    : SvgPicture.asset('icons/flags/svg/us.svg',
                        package: 'country_icons'),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  'idioma'.tr == 'Español'
                      ? Get.updateLocale(Locale('en', 'US'))
                      : Get.updateLocale(Locale('es', 'ES'));
                },
              ),
              IconButton(
                icon: Icon(Icons.brightness_6),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  //CHANGE THEME MODE
                  // EasyDynamicTheme.of(context).changeTheme();

                  Get.changeThemeMode(ThemeService().loadThemeFromBox()
                      ? ThemeMode.light
                      : ThemeMode.dark);
                  ThemeService()
                      .saveThemeToBox(!ThemeService().loadThemeFromBox());
                },
              ),
              SizedBox(
                width: screenSize.width / 50,
              ),
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Row(
                  children: [
                    FirebaseAuth.instance.currentUser != null
                        ? Container(
                            height: 60, child: ProfileFotoSignOutButton())
                        : SizedBox.shrink(),
                    // SizedBox(
                    //   width: screenSize.width / 50,
                    // ),
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: InkWell(
                          onHover: (value) {
                            // setState(() {
                            value
                                ? controller.isHovering[7] = true
                                : controller.isHovering[7] = false;
                            // });
                          },
                          onTap:
                              //  userEmail == null
                              //     ?
                              () {
                            showDialog(
                              context: context,
                              builder: (context) => AuthDialog(),
                            );
                          }
                          // : null
                          ,
                          child: FirebaseAuth.instance.currentUser == null
                              ? FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Obx(
                                    () => Text(
                                      'sign_in'.tr,
                                      style: TextStyle(
                                        color: controller.isHovering[7]
                                            ? Colors.black
                                            : Colors.white70,
                                      ),
                                    ),
                                  ),
                                )
                              : SizedBox.shrink()),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LogoDerechoInteligente extends StatelessWidget {
  const LogoDerechoInteligente({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      // color: Colors.red,
      height: 40,
      fit: BoxFit.fitHeight,
      Constants.LogoSvg,
    );
  }
}
