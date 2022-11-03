import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pulpox_admin/controllers/MenuController.dart';

import '../../../../constants/theme.dart';
import '../../../../widgets/platformButtons/profileLoginButtons.dart';
import '/responsive.dart';
import '../../../../constants.dart';

class Header extends StatelessWidget {
  var text;

  Header({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MenuPlatformController menuPlatformController =
        Get.put<MenuPlatformController>(MenuPlatformController());

    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // Get.lazyPut(() => MenuController());
              // return controller.controlMenu();
              Scaffold.of(context).openDrawer();
            },
          ),
        if (!Responsive.isMobile(context))
          Text(
            text,
            style: Theme.of(context).textTheme.headline6,
          ),
        // Obx(() => IndexedStack(
        //           index: menuPlatformController.tabIndex.value,
        //           children: [
        //             Text(
        //               "Dashboard",
        //               style: Theme.of(context).textTheme.headline6,
        //             ),
        //             Text(
        //               "Chat Soporte",
        //               style: Theme.of(context).textTheme.headline6,
        //             ),
        //             Text(
        //               "Estadisticas",
        //               style: Theme.of(context).textTheme.headline6,
        //             ),
        //             Text(
        //               "Revenue",
        //               style: Theme.of(context).textTheme.headline6,
        //             ),
        //             Text(
        //               "Informacion de Usuarios",
        //               style: Theme.of(context).textTheme.headline6,
        //             ),
        //             Text(
        //               "Creditos Maestros",
        //               style: Theme.of(context).textTheme.headline6,
        //             ),
        //             Text(
        //               "On Boarding Maestro",
        //               style: Theme.of(context).textTheme.headline6,
        //             ),
        //             Text(
        //               "Pagos",
        //               style: Theme.of(context).textTheme.headline6,
        //             ),
        //           ],
        //         )

        //     //  Text(
        //     //   "Dashboard",
        //     //   style: Theme.of(context).textTheme.headline6,
        //     // ),
        //     ),
        // IconButton(
        //   icon: Icon(Icons.brightness_6),
        //   splashColor: Colors.transparent,
        //   highlightColor: Colors.transparent,
        //   color: Theme.of(context).primaryTextTheme.headline6!.color,
        //   onPressed: () {
        //     //Change Theme Mode
        //     // EasyDynamicTheme.of(context).changeTheme();
        //     Get.changeThemeMode(ThemeService().loadThemeFromBox()
        //         ? ThemeMode.light
        //         : ThemeMode.dark);
        //     ThemeService().saveThemeToBox(!ThemeService().loadThemeFromBox());
        //   },
        // ),
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        // Expanded(child: SearchField()),
        ProfileLoginButton(),
      ],
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        // fillColor: Theme.of(context).cardTheme.color,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(defaultPadding * 0.75),
            margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            decoration: BoxDecoration(
              color: primaryColor,
              // color: Theme.of(context).primaryTextTheme.button!.decorationColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: SvgPicture.asset("assets/icons/Search.svg"),
          ),
        ),
      ),
    );
  }
}
