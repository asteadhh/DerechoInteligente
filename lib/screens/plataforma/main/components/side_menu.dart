import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pulpox_admin/constants/custom_colors.dart';

import '../../../../controllers/MenuController.dart';

class SideMenuPlatform extends GetView<MenuPlatformController> {
  const SideMenuPlatform({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => MenuPlatformController());
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset(Constants.kPulpoxPath),
          ),
          DrawerListTile(
            title: "Dashboard",
            svgSrc: "assets/icons/menu_dashbord.svg",
            press: () async {
              await controller.platformEnabledIndex(0);
              // print(contsroller.tabIndex);
            },
          ),
          DrawerListTile(
            title: "Chat Soporte",
            svgSrc: "assets/icons/menu_tran.svg",
            press: () async {
              await controller.platformEnabledIndex(1);
              // print(controller.tabIndex);
            },
          ),
          DrawerListTile(
            title: "Estadisticas",
            svgSrc: "assets/icons/menu_task.svg",
            press: () async {
              await controller.platformEnabledIndex(2);
              // print(controller.tabIndex);
            },
          ),
          DrawerListTile(
            title: "Revenue",
            svgSrc: "assets/icons/menu_doc.svg",
            press: () async {
              await controller.platformEnabledIndex(3);
              // print(controller.tabIndex);
            },
          ),
          DrawerListTile(
            title: "Información de Usuarios",
            svgSrc: "assets/icons/menu_store.svg",
            press: () async {
              await controller.platformEnabledIndex(4);
              // print(controller.tabIndex);
            },
          ),
          DrawerListTile(
            title: "Creditos Maestros",
            svgSrc: "assets/icons/menu_notification.svg",
            press: () async {
              await controller.platformEnabledIndex(5);
              // print(controller.tabIndex);
            },
          ),
          DrawerListTile(
            title: "On Boardin Maestro",
            svgSrc: "assets/icons/menu_profile.svg",
            press: () async {
              await controller.platformEnabledIndex(6);
              // print(controller.tabIndex);
            },
          ),
          DrawerListTile(
            title: "Pagos",
            svgSrc: "assets/icons/menu_setting.svg",
            press: () async {
              await controller.platformEnabledIndex(7);
              // print(controller.tabIndex);
            },
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Theme.of(context).primaryTextTheme.headline1!.color,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(
            color: Theme.of(context).primaryTextTheme.headline1!.color),
      ),
    );
  }
}
