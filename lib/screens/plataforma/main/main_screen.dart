import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/MenuController.dart';

import 'components/side_menu.dart';
import '/responsive.dart';
import '/screens/dashboard/dashboard_screen.dart';

class PlatformAdminMainScreen extends GetView<MenuController> {
  @override
  Widget build(BuildContext context) {
    // Get.put<MenuController>(MenuController());

    return PlatformScreenINIT();

    // return Obx(
    //   () => IndexedStack(
    //     index: controller.tabIndex.value,
    //     children: [
    //       Text('Acceso Denegado'),
    //       PlatformScreenINIT(),
    //       // Text('2 ${controller.tabIndex.value.toString()}'),
    //       // Text('1'),
    //       // Home(),
    //     ],
    //   ),
    // );
    // if (FirebaseAuth.instance.currentUser == null) {
    //   // return CircularProgressIndicator();
    //   return Home();
    // } else {
    //   return
    // }
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
