import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../constants/theme.dart';
import '../controllers/MenuController.dart';
import '../routes/app_pages.dart';
import '../screens/landingPage/base/home_page_landing.dart';
import '../screens/landingPage/main/main_screen.dart';
import '/utils/authentication.dart';
import '/widgets/auth_dialog.dart';
import 'package:flutter/material.dart';

class TopBarContents extends StatefulWidget {
  final double opacity;

  TopBarContents(this.opacity);

  @override
  _TopBarContentsState createState() => _TopBarContentsState();
}

class _TopBarContentsState extends State<TopBarContents> {
  final List _isHovering = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  // bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return PreferredSize(
      preferredSize: Size(screenSize.width, 1000),
      child: Container(
        color: Theme.of(context).bottomAppBarColor.withOpacity(widget.opacity),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppPages.main);
                },
                child: Text(
                  'PulPox',
                  style: TextStyle(
                    color: Colors.blueGrey[100],
                    fontSize: 20,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 3,
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: screenSize.width / 8),
                    InkWell(
                      onHover: (value) {
                        setState(() {
                          value
                              ? _isHovering[0] = true
                              : _isHovering[0] = false;
                        });
                      },
                      onTap: () {
                        Get.toNamed(AppPages.aboutUs);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'About Us',
                            style: TextStyle(
                              color: _isHovering[0]
                                  ? Colors.blue[200]
                                  : Colors.white,
                            ),
                          ),
                          SizedBox(height: 5),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: _isHovering[0],
                            child: Container(
                              height: 2,
                              width: 20,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: screenSize.width / 20),
                    InkWell(
                      onHover: (value) {
                        setState(() {
                          value
                              ? _isHovering[1] = true
                              : _isHovering[1] = false;
                        });
                      },
                      onTap: () {
                        Get.toNamed(AppPages.contactUS);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Contact Us',
                            style: TextStyle(
                              color: _isHovering[1]
                                  ? Colors.blue[200]
                                  : Colors.white,
                            ),
                          ),
                          SizedBox(height: 5),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: _isHovering[1],
                            child: Container(
                              height: 2,
                              width: 20,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    FirebaseAuth.instance.currentUser != null
                        ? Row(
                            children: [
                              SizedBox(width: screenSize.width / 20),
                              InkWell(
                                onHover: (value) {
                                  setState(() {
                                    value
                                        ? _isHovering[2] = true
                                        : _isHovering[2] = false;
                                  });
                                },
                                onTap: () {
                                  Get.toNamed(AppPages.platform);
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Administracción',
                                      style: TextStyle(
                                        color: _isHovering[2]
                                            ? Colors.blue[200]
                                            : Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Visibility(
                                      maintainAnimation: true,
                                      maintainState: true,
                                      maintainSize: true,
                                      visible: _isHovering[2],
                                      child: Container(
                                        height: 2,
                                        width: 20,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        : SizedBox.shrink(),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(Icons.brightness_6),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                color: Colors.white,
                onPressed: () {
                  //Change Theme Mode
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
              InkWell(
                onHover: (value) {
                  setState(() {
                    value ? _isHovering[3] = true : _isHovering[3] = false;
                  });
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
                    ? Text(
                        'Sign in',
                        style: TextStyle(
                          color: _isHovering[3] ? Colors.white : Colors.white70,
                        ),
                      )
                    : Row(
                        children: [
                          // CircleAvatar(
                          //   radius: 15,
                          //   backgroundImage: imageUrl != null
                          //       ? NetworkImage(imageUrl!)
                          //       : null,
                          //   child: imageUrl == null
                          //       ? Icon(
                          //           Icons.account_circle,
                          //           size: 30,
                          //         )
                          //       : Container(),
                          // ),
                          // SizedBox(width: 5),
                          // Text(
                          //   name ?? userEmail!,
                          //   style: TextStyle(
                          //     color: _isHovering[3]
                          //         ? Colors.white
                          //         : Colors.white70,
                          //   ),
                          // ),
                          SizedBox(width: 10),
                          TextButton(
                            style: TextButton.styleFrom(
                              primary: Colors.blueGrey,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            onPressed: MenuController().isProcessing.value
                                ? null
                                : () async {
                                    setState(() {
                                      MenuController().isProcessing.value =
                                          true;
                                    });
                                    await signOut().then((result) {
                                      print(result);
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                          fullscreenDialog: true,
                                          builder: (context) => LandingPageBase(
                                            widget: HomeLandingContent(),
                                          ),
                                        ),
                                      );
                                    }).catchError((error) {
                                      print('Sign Out Error: $error');
                                    });
                                    setState(() {
                                      MenuController().isProcessing.value =
                                          false;
                                    });
                                  },
                            child: Obx(
                              () => Padding(
                                padding: EdgeInsets.only(
                                  top: 8.0,
                                  bottom: 8.0,
                                ),
                                child: MenuController().isProcessing.value
                                    ? CircularProgressIndicator()
                                    : Text(
                                        'sign_out'.tr,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
