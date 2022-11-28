import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_strategy/url_strategy.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '/routes/app_pages.dart';
import '/controllers/LoginController/login_controller.dart';
import '/utils/translations.dart';
import 'constants/theme.dart';
import 'firebase_options.dart';
import 'screens/landingPage/404 Screens/error/error_screen.dart';
import 'services/auth_service.dart';

const bool USE_EMULATOR = false;
bool isWhite = false;
// final _configuration =
//     PurchasesConfiguration('appl_OqbbEQVikcpaJAqloPlswHAVzSd');
int? isviewed;
int? platformIndex;
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  // if (USE_EMULATOR) {
  //   _connectToFirebaseEmulator();
  // }
  await GetStorage.init();

  SharedPreferences prefs = await SharedPreferences.getInstance();

  // LINE TO CLEAN SHARED PREFERENCES //
  // await prefs.clear();

  isviewed = prefs.getInt('onBoard');
  platformIndex = prefs.getInt('platformIndex');

  //
  // await Purchases.configure(_configuration);

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  // NotificationSettings settings = await messaging.requestPermission(
  //   alert: true,
  //   announcement: false,
  //   badge: true,
  //   carPlay: false,
  //   criticalAlert: false,
  //   provisional: false,
  //   sound: true,
  // );

  // print('User granted permission: ${settings.authorizationStatus}');
  setPathUrlStrategy();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   home: Text('ddd'),
    // );
    Future getUserInfo() async {
      print('MyAPP ${LoginController().myUser?.uid}');
      // await MenuController().getUser();
      await LoginController().getUser();
    }

    ;
    Get.put(AuthService());
    return GetMaterialApp(
      onInit: getUserInfo,
      // onReady: getUserInfo,
      translations: Messages(),
      locale: Locale('es', 'ES'),
      fallbackLocale: Locale('es', 'ES'),
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
      ],
      theme: lightTheme,
      darkTheme: darkTheme,
      // themeMode: ThemeMode.system,
      themeMode: ThemeService().theme,
      title: 'Derecho Inteligente',
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      // getPages: appPages,
      initialRoute: AppPages.main,
      // home: Text('ddd'),
      unknownRoute: GetPage(
        name: AppPages.errorPagina,
        page: () => const Screen404(),
      ),
    );
  }
}
