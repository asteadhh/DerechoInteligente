import 'package:get/get.dart';

import '../controllers/MenuController.dart';
import '../controllers/menu_landing_page_controller.dart';
import '../services/auth_service.dart';

class MenuLandingPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MenuLandingPageController>(
      () => MenuLandingPageController(),
    );
    // Get.put<Service>(() => Api());
  }
}

class PlatformAdminMainScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MenuController>(
      () => MenuController(),
    );
    Get.lazyPut<AuthService>(
      () => AuthService(),
    );
    // Get.put<Service>(() => Api());
  }
}
