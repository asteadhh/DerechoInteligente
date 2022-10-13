import 'package:get/get.dart';

import '../../../initial_screen.dart';
import '../../features/dashboard/views/screens/drawer_screen.dart';

part 'app_routes.dart';

/// contains all configuration pages
class AppPages {
  /// when the app is opened, this page will be the first to be shown
  static const dashboard = Routes.dashboard;
  static const first = Routes.first;

  static final routes = [
    GetPage(
      name: _Paths.dashboard,
      page: () => const DashboardScreen(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.first,
      page: () => const InitialScreen(),
      // binding: DashboardBinding(),
    ),
  ];
}
