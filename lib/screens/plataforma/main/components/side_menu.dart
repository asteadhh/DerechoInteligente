import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pulpox_admin/constants/custom_colors.dart';
import 'package:pulpox_admin/controllers/LoginController/login_controller.dart';

import '../../../../constants/theme.dart';
import '../../../../responsive.dart';
import '../../../../routes/app_pages.dart';
import '../../../../widgets/explore_drawer.dart';

class SideMenuPlatform extends GetView<LoginController> {
  const SideMenuPlatform({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginController loginController =
        Get.put<LoginController>(LoginController());
    return Drawer(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  if (Responsive.isDesktop(context))
                    DrawerHeader(
                      child: Image.asset(Constants.kPulpoxPath),
                    ),
                  if (!Responsive.isDesktop(context))
                    SizedBox(
                      // height: MediaQuery.of(context).size.height * .15,
                      height: 150,
                      child: DrawerHeader(
                        //CAMBIA ESTO//
                        // child: ProfileLoginButton(),
                        child: Login_information_Choice(),
                      ),
                    ),
                  loginController.myUserPermitions?.admin == 'verdad'
                      ? DrawerListTile(
                          title: "Dashboard",
                          svgSrc: "assets/icons/menu_dashbord.svg",
                          press: () async {
                            // await controller.platformEnabledIndex(0);
                            Get.toNamed(AppPages.platform);
                            // print(contsroller.tabIndex);
                          },
                        )
                      : SizedBox.shrink(),
                  loginController.myUserPermitions?.chatSoporte == 'verdad'
                      ? DrawerListTile(
                          title: "Chat Soporte",
                          svgSrc: "assets/icons/menu_tran.svg",
                          press: () async {
                            // await controller.platformEnabledIndex(1);
                            Get.toNamed(AppPages.chatSoporte);
                            // print(controller.tabIndex);
                          },
                        )
                      : SizedBox.shrink(),
                  loginController.myUserPermitions?.estadisticas == 'verdad'
                      ? DrawerListTile(
                          title: "Estadisticas",
                          svgSrc: "assets/icons/menu_task.svg",
                          press: () async {
                            // await controller.platformEnabledIndex(2);

                            Get.toNamed(AppPages.estadisticas);
                            // print(controller.tabIndex);
                          },
                        )
                      : SizedBox.shrink(),
                  loginController.myUserPermitions?.revenue == 'verdad'
                      ? DrawerListTile(
                          title: "Revenue",
                          svgSrc: "assets/icons/money2.svg",
                          press: () async {
                            Get.toNamed(AppPages.revenue);
                            // await controller.platformEnabledIndex(3);
                            // print(controller.tabIndex);
                          },
                        )
                      : SizedBox.shrink(),
                  loginController.myUserPermitions?.informacionDeUsuario ==
                          'verdad'
                      ? DrawerListTile(
                          title: "Información de Usuarios",
                          svgSrc: "assets/icons/menu_store.svg",
                          press: () async {
                            Get.toNamed(AppPages.informacionDeUsuario);
                            // await controller.platformEnabledIndex(4);
                            // print(controller.tabIndex);
                          },
                        )
                      : SizedBox.shrink(),
                  loginController.myUserPermitions?.creditosMaestros == 'verdad'
                      ? DrawerListTile(
                          title: "Creditos Maestros",
                          svgSrc: "assets/icons/menu_notification.svg",
                          press: () async {
                            Get.toNamed(AppPages.creditosMaestros);
                            // await controller.platformEnabledIndex(5);
                            // print(controller.tabIndex);
                          },
                        )
                      : SizedBox.shrink(),
                  loginController.myUserPermitions?.onBoardingMaestro ==
                          'verdad'
                      ? DrawerListTile(
                          title: "On Boardin Maestro",
                          svgSrc: "assets/icons/menu_profile.svg",
                          press: () async {
                            Get.toNamed(AppPages.onBoardingMaestros);
                            // await controller.platformEnabledIndex(6);
                            // print(controller.tabIndex);
                          },
                        )
                      : SizedBox.shrink(),
                  loginController.myUserPermitions?.pagos == 'verdad'
                      ? DrawerListTile(
                          title: "Pagos",
                          svgSrc: "assets/icons/menu_setting.svg",
                          press: () async {
                            Get.toNamed(AppPages.pagos);
                            // await controller.platformEnabledIndex(7);
                            // print(controller.tabIndex);
                          },
                        )
                      : SizedBox.shrink(),
                ],
              ),

              Expanded(child: SizedBox.shrink()),
              // UserLoginWidget(),
              if (!Responsive.isDesktop(context))
                Column(children: [
                  DrawerListTile(
                    title: "Dark Mode",
                    svgSrc: "assets/icons/dark-mode.svg",
                    press: () async {
                      Get.changeThemeMode(ThemeService().loadThemeFromBox()
                          ? ThemeMode.light
                          : ThemeMode.dark);
                      ThemeService()
                          .saveThemeToBox(!ThemeService().loadThemeFromBox());
                    },
                  ),
                  DrawerListTile(
                    title: "Sign Out",
                    svgSrc: "assets/icons/sign-out.svg",
                    press: () async {
                      LoginController().signOut();
                    },
                  ),
                ]),

              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Divider(
                  color: Colors.blueGrey[400],
                  thickness: 2,
                ),
              ),
              // Expanded(child: SizedBox()),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Copyright © 2022 | PulPox SpA',
                  style: TextStyle(
                    color: Colors.blueGrey[300],
                    fontSize: 14,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
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
