import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/app_pages.dart';
import '../services/auth_service.dart';

class AdminGuard extends GetMiddleware {
  final authService = Get.find<AuthService>();

  @override
  RouteSettings? redirect(String? route) {
    return authService.isAdmin.value
        ? null
        : const RouteSettings(name: AppPages.main);
  }
}
