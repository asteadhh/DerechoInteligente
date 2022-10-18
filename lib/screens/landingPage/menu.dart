import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../controllers/menu_landing_page_controller.dart';

class MenuLandingPage extends GetView<MenuLandingPageController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => MenuLandingPageController());
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _menuItem(title: 'Home', activo: 0),
              _menuItem(title: 'About us', activo: 1),
              _menuItem(title: 'Contact us', activo: 2),
              _menuItem(title: 'Help', activo: 3),
            ],
          ),
          Row(
            children: [
              _menuItem(title: 'Sign In', isActive: true, activo: 4),
              _registerButton()
            ],
          ),
        ],
      ),
    );
  }

  Widget _menuItem({var title = 'Title Menu', isActive = false, var activo}) {
    return GestureDetector(
      onTap: () => controller.changeTabIndex(activo),
      child: Padding(
        padding: const EdgeInsets.only(right: 75),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          // onEnter: (event) {
          //   controller.changeTabIndex(activo);
          // },
          // onEnter: ((event) async {
          //   Get.lazyPut(() => MenuLandingPageController());
          //   print(title);
          //   controller.activatedScreen = title;
          //   print(controller.activatedScreen);
          // }),
          child: Column(
            children: [
              Text(
                '$title',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isActive ? Colors.deepPurple : Colors.grey,
                ),
              ),
              SizedBox(
                height: 6,
              ),
              isActive
                  ? Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    )
                  : SizedBox()
            ],
          ),
        ),
      ),
    );
  }

  Widget _registerButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: grey200,
            spreadRadius: 10,
            blurRadius: 12,
          ),
        ],
      ),
      child: Text(
        'Register',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black54,
        ),
      ),
    );
  }
}
