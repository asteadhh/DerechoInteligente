import 'package:get/get.dart';

import '../middlewares/admin_guard.dart';
import '../screens/dashboard/screen/dashboard_screen_platform.dart';
import '/screens/landingPage/aboutUs/aboutUs_screen.dart';
import '/screens/landingPage/contactUs/contact_us_screen.dart';
import '/screens/landingPage/help/help_screen.dart';
import '/screens/landingPage/menu.dart';

import '../screens/home_page.dart';
import '../screens/plataforma/main/template_platform_screen.dart';
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
  static const dashboard = _Paths.dashboard;
  static const chatSoporte = _Paths.chatSoporte;
  static const estadisticas = _Paths.estadisticas;
  static const revenue = _Paths.revenue;
  static const informacionDeUsuario = _Paths.informacionDeUsuario;
  static const creditosMaestros = _Paths.creditosMaestros;
  static const onBoardingMaestros = _Paths.onBoardingMaestros;
  static const pagos = _Paths.pagos;

  static final routes = [
    GetPage(
      name: _Paths.main,
      page: () => Home(),
      transition: Transition.noTransition,
      // binding: NotificacionesScreenBinding(),
    ),
    GetPage(
      name: _Paths.platform,
      page: () => PlatformAdminMainScreen(),
      binding: PlatformAdminMainScreenBinding(),
      middlewares: [
        AdminGuard(), // Add the middleware here
      ],
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.landingMenu,
      page: () => MenuLandingPage(),
      binding: MenuLandingPageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.aboutUs,
      page: () => AboutUsScreen(),
      transition: Transition.noTransition,
      // binding: MenuLandingPageBinding(),
    ),
    GetPage(
      name: _Paths.contactUs,
      page: () => ContactUsScreen(),
      transition: Transition.noTransition,
      // binding: MenuLandingPageBinding(),
    ),
    GetPage(
      name: _Paths.help,
      page: () => HelpScreen(),
      transition: Transition.noTransition,
      // binding: MenuLandingPageBinding(),
    ),
    GetPage(
      name: _Paths.dashboard,
      page: () => PlatformAdminMainScreen(),
      transition: Transition.noTransition,
      // binding: MenuLandingPageBinding(),
    ),
    GetPage(
      name: _Paths.chatSoporte,
      page: () => ChatSoporteScreen(),
      transition: Transition.noTransition,
      // binding: MenuLandingPageBinding(),
    ),
    GetPage(
      name: _Paths.estadisticas,
      page: () => EstadisticasScreen(),
      transition: Transition.noTransition,
      // binding: MenuLandingPageBinding(),
    ),
    GetPage(
      name: _Paths.revenue,
      page: () => RevenueScreen(),
      transition: Transition.noTransition,
      // binding: MenuLandingPageBinding(),
    ),
    GetPage(
      name: _Paths.informacionDeUsuario,
      page: () => InformacionUsuarioScreen(),
      transition: Transition.noTransition,
      // binding: MenuLandingPageBinding(),
    ),
    GetPage(
      name: _Paths.creditosMaestros,
      page: () => CreditosMaestrosScreen(),
      transition: Transition.noTransition,
      // binding: MenuLandingPageBinding(),
    ),
    GetPage(
      name: _Paths.pagos,
      page: () => PagosScreen(),
      transition: Transition.noTransition,
      // binding: MenuLandingPageBinding(),
    ),
    GetPage(
      name: _Paths.onBoardingMaestros,
      page: () => OnBoardingMaestrosScreen(),
      transition: Transition.noTransition,
      // binding: MenuLandingPageBinding(),
    ),
  ];
}
