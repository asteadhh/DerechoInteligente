import 'package:get/get.dart';

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
