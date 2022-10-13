import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/config/routes/app_pages.dart';

class LoginRegisterController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  late bool success;
  late String userEmail;

  void dispose() {
    //Clean up the controller when widget is disposed
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void register() async {
    final User? user = (await _auth.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    ))
        .user;
    try {
      if (user != null) {
        success = true;
        print('Registro Ok');
        Future.delayed(
          Duration(milliseconds: 2),
          () {
            Get.toNamed(AppPages.dashboard);
          },
        );
        userEmail = user.email!;
      } else {
        success = false;
      }
    } catch (e) {
      Get.snackbar('Fallo', '$e', snackPosition: SnackPosition.BOTTOM);
    }
  }
}
