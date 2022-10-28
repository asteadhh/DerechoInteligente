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

class ChatSoporteGuard extends GetMiddleware {
  final authService = Get.find<AuthService>();

  @override
  RouteSettings? redirect(String? route) {
    return authService.chatSoporteAccess.value
        ? null
        : const RouteSettings(name: AppPages.main);
  }
}

class EstadisticasGuard extends GetMiddleware {
  final authService = Get.find<AuthService>();

  @override
  RouteSettings? redirect(String? route) {
    return authService.estadisticasAccess.value
        ? null
        : const RouteSettings(name: AppPages.main);
  }
}

class RevenueGuard extends GetMiddleware {
  final authService = Get.find<AuthService>();

  @override
  RouteSettings? redirect(String? route) {
    return authService.revenueAccess.value
        ? null
        : const RouteSettings(name: AppPages.main);
  }
}

class InformacionDeUsuarioGuard extends GetMiddleware {
  final authService = Get.find<AuthService>();

  @override
  RouteSettings? redirect(String? route) {
    return authService.informacionUsuarioAccess.value
        ? null
        : const RouteSettings(name: AppPages.main);
  }
}

class CreditosMaestrosGuard extends GetMiddleware {
  final authService = Get.find<AuthService>();

  @override
  RouteSettings? redirect(String? route) {
    return authService.creditosMaestrosAccess.value
        ? null
        : const RouteSettings(name: AppPages.main);
  }
}

class OnBoardingGuard extends GetMiddleware {
  final authService = Get.find<AuthService>();

  @override
  RouteSettings? redirect(String? route) {
    return authService.onBoardingMaestroAccess.value
        ? null
        : const RouteSettings(name: AppPages.main);
  }
}

class PagosGuard extends GetMiddleware {
  final authService = Get.find<AuthService>();

  @override
  RouteSettings? redirect(String? route) {
    return authService.pagosAccess.value
        ? null
        : const RouteSettings(name: AppPages.main);
  }
}
