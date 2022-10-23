import 'package:get/get.dart';

import '../controllers/MenuController.dart';
import '../controllers/menu_landing_page_controller.dart';

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
    // Get.put<Service>(() => Api());
  }
}
