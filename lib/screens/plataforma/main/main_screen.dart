import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulpox_admin/controllers/LoginController/login_controller.dart';

import 'components/side_menu.dart';
import '/responsive.dart';
import '/screens/dashboard/dashboard_screen.dart';

class PlatformAdminMainScreen extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return PlatformScreenINIT();
  }
}

class PlatformScreenINIT extends StatelessWidget {
  const PlatformScreenINIT({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
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
