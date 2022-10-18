import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '/controllers/menu_landing_page_controller.dart';

class LandingPageDrawer extends GetView<MenuLandingPageController> {
  const LandingPageDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Column(
            children: [
              DrawerHeader(
                child: Image.asset("assets/images/logo.png"),
              ),
              DrawerListTile(
                title: "Home",
                icon: Icons.home,
                press: () {
                  if (controller.tabIndex.toString() == '0') {
                    // print(Get.currentRoute);
                    print('back home');
                    Get.back();
                  } else {
                    Scaffold.of(context).closeDrawer();
                    // Get.toNamed(AppPages.platform);
                    controller.changeTabIndex(0);
                  }
                },
              ),
              DrawerListTile(
                title: "About Us",
                icon: Icons.people,
                press: () {
                  if (controller.tabIndex.toString() == '1') {
                    // print(Get.currentRoute);
                    print('back about Us');
                    Get.back();
                  } else {
                    Scaffold.of(context).closeDrawer();
                    // Get.toNamed(AppPages.platform);
                    controller.changeTabIndex(1);
                  }
                },
              ),
              DrawerListTile(
                title: "Contact Us",
                icon: Icons.contact_phone,
                press: () {
                  if (controller.tabIndex.toString() == '2') {
                    // print(Get.currentRoute);
                    print('back about Us');
                    Get.back();
                  } else {
                    Scaffold.of(context).closeDrawer();
                    // Get.toNamed(AppPages.platform);
                    controller.changeTabIndex(2);
                  }
                },
              ),
              DrawerListTile(
                title: "Help",
                icon: Icons.help,
                press: () {
                  if (controller.tabIndex.toString() == '3') {
                    // print(Get.currentRoute);
                    print('back about Us');
                    Get.back();
                  } else {
                    Scaffold.of(context).closeDrawer();
                    // Get.toNamed(AppPages.platform);
                    controller.changeTabIndex(3);
                  }
                },
              ),
            ],
          ),
          Column(
            children: [
              DrawerListTile(
                title: "Sign In",
                icon: Icons.login,
                press: () {
                  if (controller.tabIndex.toString() == '4') {
                    // print(Get.currentRoute);
                    print('back about Us');
                    Get.back();
                  } else {
                    Scaffold.of(context).closeDrawer();
                    // Get.toNamed(AppPages.platform);
                    controller.changeTabIndex(4);
                  }
                },
              ),
              DrawerListTile(
                title: "Register",
                icon: Icons.app_registration_rounded,
                press: () {
                  if (controller.tabIndex.toString() == '5') {
                    // print(Get.currentRoute);
                    print('back about Us');
                    Get.back();
                  } else {
                    Scaffold.of(context).closeDrawer();
                    // Get.toNamed(AppPages.platform);
                    controller.changeTabIndex(5);
                  }
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  DrawerListTile(
      {Key? key,
      // For selecting those three line once press "Command+D"
      required this.title,
      this.svgSrc,
      required this.press,
      this.icon})
      : super(key: key);

  var icon;
  var svgSrc;
  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: svgSrc != null
          ? SvgPicture.asset(
              svgSrc,
              color: Colors.white54,
              height: 16,
            )
          : Icon(icon),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
