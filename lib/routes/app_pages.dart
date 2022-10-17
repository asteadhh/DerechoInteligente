import 'package:get/get.dart';

import '../screens/main/main_screen.dart';

part 'app_routes.dart';

/// contains all configuration pages
class AppPages {
  // Future<FirebaseApp> firebaseApp =  Firebase.initializeApp();
  //  User? user = FirebaseAuth.instance.currentUser;
  /// when the app is opened, this page will be the first to be shown
  static const main = _Paths.main;

  static final routes = [
    GetPage(
      name: _Paths.main,
      page: () => MainScreen(),
      // binding: NotificacionesScreenBinding(),
    ),
  ];
}
