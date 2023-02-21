import 'package:derecho_inteligente/screens/landingPage/cancelar/cancelar_screen.dart';
import 'package:derecho_inteligente/screens/landingPage/contactUs%20copy%202/contact_us_screen.dart';
import 'package:derecho_inteligente/screens/landingPage/contactUs%20copy%203/contact_us_screen.dart';
import 'package:derecho_inteligente/screens/landingPage/faq/faq_screen.dart';
import 'package:derecho_inteligente/screens/landingPage/politica%20de%20privacidad%20screen/politica_de_privacidad_screen.dart';
import 'package:derecho_inteligente/screens/landingPage/postulaciones/postulaciones_screen.dart';
import 'package:get/get.dart';

import '../middlewares/admin_guard.dart';
import '../screens/dashboard/screen/dashboard_screen_platform.dart';
import '../screens/landingPage/pagos/pagos_screen.dart';
import '../screens/landingPage/work/work_screen.dart';
import '/screens/landingPage/aboutUs/aboutUs_screen.dart';
import '/screens/landingPage/contactUs/contact_us_screen.dart';
import '/screens/landingPage/help/help_screen.dart';
import '/screens/landingPage/menu.dart';

import '../screens/home_page.dart';
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
  static const postulaciones = _Paths.postulaciones;
  static const faq = _Paths.faq;
  static const pagosScreen = _Paths.pagosScreen;
  static const cancelar = _Paths.cancelar;
  static const work = _Paths.work;
  static const termsOfService = _Paths.termsOfService;
  static const privacyPolicy = _Paths.privacyPolicy;
  static const warranty = _Paths.warranty;

  static final routes = [
//Legal
    GetPage(
      name: _Paths.termsOfService,
      page: () => TermsAndServicesScreen(),
      transition: Transition.noTransition,
      // binding: NotificacionesScreenBinding(),
    ),
    GetPage(
      name: _Paths.privacyPolicy,
      page: () => PoliticaDePrivacidadScreen(),
      transition: Transition.noTransition,
      // binding: NotificacionesScreenBinding(),
    ),
    GetPage(
      name: _Paths.warranty,
      page: () => WarrantyScreen(),
      transition: Transition.noTransition,
      // binding: NotificacionesScreenBinding(),
    ),
    //Legal

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
      name: _Paths.postulaciones,
      page: () => PostulacionesScreen(),
      transition: Transition.noTransition,
      // binding: MenuLandingPageBinding(),
    ),
    GetPage(
      name: _Paths.pagosScreen,
      page: () => PagosLandingScreen(),
      transition: Transition.noTransition,
      // binding: MenuLandingPageBinding(),
    ),
    GetPage(
      name: _Paths.work,
      page: () => WorkScreen(),
      transition: Transition.noTransition,
      // binding: MenuLandingPageBinding(),
    ),
    GetPage(
      name: _Paths.cancelar,
      page: () => CancelarScreen(),
      transition: Transition.noTransition,
      // binding: MenuLandingPageBinding(),
    ),
    GetPage(
      name: _Paths.faq,
      page: () => FaqScreen(),
      transition: Transition.noTransition,
      // binding: MenuLandingPageBinding(),
    ),
    // GetPage(
    //   name: _Paths.dashboard,
    //   page: () => PlatformAdminMainScreen(),
    //   transition: Transition.noTransition,
    //   // binding: MenuLandingPageBinding(),

    // ),
    GetPage(
      name: _Paths.chatSoporte,
      page: () => ChatSoporteScreen(),
      transition: Transition.noTransition,
      // binding: MenuLandingPageBinding(),
      middlewares: [
        ChatSoporteGuard(), // Add the middleware here
      ],
    ),
    GetPage(
      name: _Paths.estadisticas,
      page: () => EstadisticasScreen(),
      transition: Transition.noTransition,
      middlewares: [
        EstadisticasGuard(), // Add the middleware here
      ],
      // binding: MenuLandingPageBinding(),
    ),
    GetPage(
      name: _Paths.revenue,
      page: () => RevenueScreen(),
      transition: Transition.noTransition,
      // binding: MenuLandingPageBinding(),
      middlewares: [
        RevenueGuard(), // Add the middleware here
      ],
    ),
    GetPage(
      name: _Paths.informacionDeUsuario,
      page: () => InformacionUsuarioScreen(),
      transition: Transition.noTransition,
      // binding: MenuLandingPageBinding(),
      middlewares: [
        InformacionDeUsuarioGuard(), // Add the middleware here
      ],
    ),
    GetPage(
      name: _Paths.creditosMaestros,
      page: () => CreditosMaestrosScreen(),
      transition: Transition.noTransition,
      // binding: MenuLandingPageBinding(),
      middlewares: [
        CreditosMaestrosGuard(), // Add the middleware here
      ],
    ),
    GetPage(
      name: _Paths.pagos,
      page: () => PagosScreen(),
      transition: Transition.noTransition,
      // binding: MenuLandingPageBinding(),
      middlewares: [
        PagosGuard(), // Add the middleware here
      ],
    ),
    GetPage(
      name: _Paths.onBoardingMaestros,
      page: () => OnBoardingMaestrosScreen(),
      transition: Transition.noTransition,
      // binding: MenuLandingPageBinding(),
      middlewares: [
        OnBoardingGuard(), // Add the middleware here
      ],
    ),
  ];
}
