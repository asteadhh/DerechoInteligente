import 'package:get/get.dart';

class AuthService extends GetxService {
  Future<AuthService> init() async => this;

  final RxBool isAdmin = true.obs;
  final RxBool chatSoporteAccess = true.obs;
  final RxBool estadisticasAccess = true.obs;
  final RxBool revenueAccess = true.obs;
  final RxBool informacionUsuarioAccess = true.obs;
  final RxBool creditosMaestrosAccess = true.obs;
  final RxBool onBoardingMaestroAccess = true.obs;
  final RxBool pagosAccess = true.obs;

  void setIsAdmin(bool newValue) {
    isAdmin.value = newValue;
  }

  void setChatSoporteAccess(bool newValue) {
    chatSoporteAccess.value = newValue;
  }

  void setStadisticasAccess(bool newValue) {
    estadisticasAccess.value = newValue;
  }

  void setRevenueAccess(bool newValue) {
    revenueAccess.value = newValue;
  }

  void setInformacionUsuarioAccess(bool newValue) {
    informacionUsuarioAccess.value = newValue;
  }

  void setCreditosMaestrosAccess(bool newValue) {
    creditosMaestrosAccess.value = newValue;
  }

  void setOnBoardingMaestroAccess(bool newValue) {
    onBoardingMaestroAccess.value = newValue;
  }

  void setPagosAccess(bool newValue) {
    pagosAccess.value = newValue;
  }
}
