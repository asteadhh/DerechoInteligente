import 'package:firebase_analytics/firebase_analytics.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulpox_admin/routes/app_pages.dart';

import '/utils/translations.dart';
import 'constants/theme.dart';
import 'screens/signIn/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Pulpox Landing',

//       //areglar
//       theme: ThemeData.dark().copyWith(
//         scaffoldBackgroundColor: bgColor,
//         textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
//             .apply(bodyColor: Colors.white),
//         canvasColor: secondaryColor,
//       ),
// //areglar

      translations: Messages(),
      locale: Locale('es', 'ES'),
      fallbackLocale: Locale('es', 'ES'),
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
      ],
      // theme: Themes.light,
      theme: lightTheme,
      // darkTheme: Themes.dark,
      darkTheme: darkTheme,
      // themeMode: ThemeMode.system,
      themeMode: ThemeService().theme,
      title: 'Pulpox',
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,

      home: LoginPage(),
      // home: MultiProvider(
      //   providers: [
      //     ChangeNotifierProvider(
      //       create: (context) => MenuController(),
      //     ),
      //   ],
      //   // child: MainScreen(),
      //   child: LoginPage(),
      // ),
    );
  }
}
