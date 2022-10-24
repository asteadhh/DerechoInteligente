import 'package:get/get.dart';

class AuthService extends GetxService {
  Future<AuthService> init() async => this;

  final RxBool isAdmin = false.obs;

  void setIsPremium(bool newValue) {
    isAdmin.value = newValue;
  }
}
