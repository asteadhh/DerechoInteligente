import 'firebase_options.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/config/routes/app_pages.dart';
import 'app/config/themes/app_theme.dart';
import 'initial_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var size, height, width;
    // size = MediaQuery.of(context).size;
    // height = size.height;
    // width = size.width;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pulpox Abogados',
      theme: AppTheme.basic,
      // initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      // getPages: [
      //   GetPage(name: '/page-three', page: () => const PageThree()),
      //   GetPage(
      //       name: '/page-four/:data',
      //       page: () => const PageFour()) // Dynamic route
      // ],
      home:
          // kIsWeb
          //     ? Login(
          //         screenHeight: MediaQuery.of(context).size.height,
          //       )
          //     :
          InitialScreen(),

      //#####ALTERNATIVE####
      // Container(
      //   child: Builder(
      //     builder: (BuildContext context) {
      //       final screenHeight = MediaQuery.of(context).size.height;

      //       return Onboarding(
      //         screenHeight: screenHeight,
      //       );
      //     },
      //   ),
      // ),
      // home: InitialScreen(),
    );
  }
}

class CustomScrollBehaviour extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
