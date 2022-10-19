import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'components/side_menu.dart';
import '/controllers/MenuController.dart';
import '/responsive.dart';
import '/screens/dashboard/dashboard_screen.dart';

class MainScreen extends GetView<MenuController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: context.read<MenuController>().scaffoldKey,
      drawer: SideMenuPlatform(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenuPlatform(),
                // child: Container(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              // child: Container(),
              child: DashboardScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
