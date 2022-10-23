import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulpox_admin/screens/landingPage/aboutUs/aboutUs_screen.dart';
import 'package:pulpox_admin/screens/landingPage/contactUs/contact_us_screen.dart';
import 'package:pulpox_admin/screens/landingPage/help/help_screen.dart';
import 'package:pulpox_admin/screens/landingPage/menu.dart';

import '../screens/home_page.dart';
import '../screens/landingPage/404 Screens/error/error_screen.dart';
import '../screens/landingPage/main/main_screen.dart';
import '../screens/plataforma/main/main_screen.dart';
import '../screens/signIn/login_screen.dart';
import 'bindings.dart';

part 'app_routes.dart';

/// contains all configuration pages
class AppPages {
  // Future<FirebaseApp> firebaseApp =  Firebase.initializeApp();
  //  User? user = FirebaseAuth.instance.currentUser;
  /// when the app is opened, this page will be the first to be shown
  static const main = _Paths.main;
  static const aboutUs = _Paths.aboutUs;
  static const contactUS = _Paths.contactUs;
  static const help = _Paths.help;
  static const login = _Paths.iniciosesion;
  static const register = _Paths.registrosesion;
  static const platform = _Paths.platform;
  static const iniciosesion = _Paths.iniciosesion;
  static const errorPagina = _Paths.errorPagina;

  static final routes = [
    GetPage(
      name: _Paths.main,
      page: () => Home(),
      // binding: NotificacionesScreenBinding(),
    ),
    // GetPage(
    //   name: _Paths.errorPagina,
    //   page: () => AppPages.routes.contains(Get.currentRoute)
    //       ? Home()
    //       : const Screen404(),
    // ),
    // GetPage(
    //   name: _Paths.errorPagina,
    //   page: () => ErrorScreen(),
    //   // binding: NotificacionesScreenBinding(),
    // ),
    GetPage(
      name: _Paths.platform,
      page: () => PlatformAdminMainScreen(),
      binding: PlatformAdminMainScreenBinding(),
    ),
    GetPage(
      name: _Paths.landingMenu,
      page: () => MenuLandingPage(),
      binding: MenuLandingPageBinding(),
    ),
    GetPage(
      name: _Paths.aboutUs,
      page: () => AboutUsScreen(),
      // binding: MenuLandingPageBinding(),
    ),
    GetPage(
      name: _Paths.contactUs,
      page: () => ContactUsScreen(),
      // binding: MenuLandingPageBinding(),
    ),
    GetPage(
      name: _Paths.help,
      page: () => HelpScreen(),
      // binding: MenuLandingPageBinding(),
    ),
    // GetPage(
    //   name: _Paths.iniciosesion,
    //   page: () => (),
    //   // binding: MenuLandingPageBinding(),
    // ),
  ];
}
