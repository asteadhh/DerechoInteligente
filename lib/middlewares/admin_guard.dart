import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulpox_admin/controllers/LoginController/login_controller.dart';

import '../routes/app_pages.dart';
import '../services/auth_service.dart';

class AdminGuard extends GetMiddleware {
  final authService = Get.find<AuthService>();
  final loginController = Get.put<LoginController>(LoginController());

  @override
  RouteSettings? redirect(String? route) {
    print('AdminGuard ${loginController.myUserPermitions?.admin}');
    return loginController.myUserPermitions?.admin == 'verdad'
        ? null
        : const RouteSettings(name: AppPages.main);
  }
}

class ChatSoporteGuard extends GetMiddleware {
  final authService = Get.find<AuthService>();
  final loginController = Get.put<LoginController>(LoginController());

  @override
  RouteSettings? redirect(String? route) {
    print('ChatSoporteGuard ${loginController.myUserPermitions?.chatSoporte}');
    return loginController.myUserPermitions?.chatSoporte == 'verdad'
        ? null
        : const RouteSettings(name: AppPages.main);
  }
}

class EstadisticasGuard extends GetMiddleware {
  final loginController = Get.put<LoginController>(LoginController());
  final authService = Get.find<AuthService>();

  @override
  RouteSettings? redirect(String? route) {
    print(
        'EstadisticasGuard ${loginController.myUserPermitions?.estadisticas}');
    return loginController.myUserPermitions?.estadisticas == 'verdad'
        ? null
        : const RouteSettings(name: AppPages.main);
  }
}

class RevenueGuard extends GetMiddleware {
  final loginController = Get.put<LoginController>(LoginController());
  final authService = Get.find<AuthService>();

  @override
  RouteSettings? redirect(String? route) {
    print('RevenueGuard ${loginController.myUserPermitions?.revenue}');
    return loginController.myUserPermitions?.revenue == 'verdad'
        ? null
        : const RouteSettings(name: AppPages.main);
  }
}

class InformacionDeUsuarioGuard extends GetMiddleware {
  final loginController = Get.put<LoginController>(LoginController());
  final authService = Get.find<AuthService>();

  @override
  RouteSettings? redirect(String? route) {
    print(
        'InformacionDeUsuarioGuard ${loginController.myUserPermitions?.informacionDeUsuario}');
    return loginController.myUserPermitions?.informacionDeUsuario == 'verdad'
        ? null
        : const RouteSettings(name: AppPages.main);
  }
}

class CreditosMaestrosGuard extends GetMiddleware {
  final loginController = Get.put<LoginController>(LoginController());
  final authService = Get.find<AuthService>();

  @override
  RouteSettings? redirect(String? route) {
    print(
        'CreditosMaestrosGuard ${loginController.myUserPermitions?.creditosMaestros}');
    return loginController.myUserPermitions?.creditosMaestros == 'verdad'
        ? null
        : const RouteSettings(name: AppPages.main);
  }
}

class OnBoardingGuard extends GetMiddleware {
  final loginController = Get.put<LoginController>(LoginController());

  final authService = Get.find<AuthService>();

  @override
  RouteSettings? redirect(String? route) {
    print(
        'OnBoardingGuard ${loginController.myUserPermitions?.onBoardingMaestro}');
    return loginController.myUserPermitions?.onBoardingMaestro == 'verdad'
        ? null
        : const RouteSettings(name: AppPages.main);
  }
}

class PagosGuard extends GetMiddleware {
  final loginController = Get.put<LoginController>(LoginController());

  final authService = Get.find<AuthService>();

  @override
  RouteSettings? redirect(String? route) {
    print('PagosGuard ${loginController.myUserPermitions?.pagos}');
    return loginController.myUserPermitions?.pagos == 'verdad'
        ? null
        : const RouteSettings(name: AppPages.main);
  }
}
