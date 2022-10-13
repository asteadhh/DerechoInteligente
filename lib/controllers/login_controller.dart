import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../app/config/routes/app_pages.dart';
import '../initial_screen.dart';
import '../screens/login/widgets/login_form.dart';
import '../screens/onboarding/onboarding.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //
  void signInWithEmailAndPassword() async {
    try {
      final User? user = (await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      ))
          .user;
      Get.snackbar('Hola', 'Su ingreso ha sido exitoso',
          snackPosition: SnackPosition.BOTTOM);
      print('Ingreso Bien');
      Future.delayed(
        Duration(milliseconds: 2),
        () {
          Get.toNamed(AppPages.dashboard);
        },
      );
    } catch (e) {
      Get.snackbar(
        'Fallo',
        'No puede ingresar, revise $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

//SignOUT
  void _signOut() async {
    await _auth.signOut();
  }

  void signOut() async {
    final User? user = await _auth.currentUser;

    if (user == null) {
      Get.snackbar('Out', 'No One has signed in.',
          snackPosition: SnackPosition.BOTTOM);
      // Get.toNamed(AppPages.first);
      return;
    }
    _signOut();
    final String uid = user.uid;
    Get.snackbar('Out', uid + ' has successfully signed out.',
        snackPosition: SnackPosition.BOTTOM);
    Get.toNamed(AppPages.first);
    Builder(
      builder: (BuildContext context) {
        final screenHeight = MediaQuery.of(context).size.height;

        return Onboarding(
          screenHeight: screenHeight,
        );
      },
    );
  }

  void signInWithGoogle() async {
    try {
      UserCredential userCredential;

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final OAuthCredential googleAuthCredential =
          GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      userCredential = await _auth.signInWithCredential(googleAuthCredential);
      final user = userCredential.user;
      Get.snackbar('Hola', 'Inicio sesion con ${user!.displayName} con Google');
      print('Ingreso Bien');
      Future.delayed(
        Duration(milliseconds: 2),
        (() {
          Get.toNamed(AppPages.dashboard);
        }),
      );
    } catch (e) {
      Get.snackbar('Fallo', 'Failed to sign in with Google: $e',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void sendpasswordresetemail() async {
    try {
      await _auth
          .sendPasswordResetEmail(email: emailController.text)
          .then((value) {
        Get.toNamed(AppPages.first);
        Get.snackbar("Password Reset email link is been sent", "Success",
            snackPosition: SnackPosition.BOTTOM);
      }).catchError((onError) => Get.snackbar(
              "Error In Email Reset", onError.message,
              snackPosition: SnackPosition.BOTTOM));
    } catch (e) {
      Get.snackbar('Fallo', '$e', snackPosition: SnackPosition.BOTTOM);
    }
  }
}
