import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/LoginController/login_controller.dart';
import '../../dashboard/content/dashboardContent/dashboard_content.dart';
import 'components/side_menu.dart';
import '/responsive.dart';
import '../../dashboard/platform_main_screen.dart';

class PlatformAdminTemplateScreen extends StatelessWidget {
  PlatformAdminTemplateScreen({
    required this.contentWidget,
    required this.templateName,
    Key? key,
  }) : super(key: key);

  String templateName;
  Widget contentWidget;

  @override
  Widget build(BuildContext context) {
    final LoginController loginController =
        Get.put<LoginController>(LoginController());
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
              child: MainScreenTemplateScreen(
                tabName: templateName,
                screenContent: contentWidget,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
