import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../db/my_user.dart';
import '../../models/user_chat.dart';
import '../../routes/app_pages.dart';

class LoginController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Rx<UserChatInfo?> _myUser = Rx<UserChatInfo?>(null);

  UserChatInfo? get myUser => _myUser.value;

  void updateUserStream() {
    var currentUser = auth.currentUser;
    print('UPDATE');
    _myUser.bindStream(MyUserDB.myUserStream(currentUser));
  }

  @override
  void onInit() {
    updateUserStream();
    super.onInit();
  }

  //
  void signInWithEmailAndPassword() async {
    try {
      await auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Get.snackbar('Hola', 'Su ingreso ha sido exitoso',
          snackPosition: SnackPosition.TOP);
      print('Ingreso Bien');
      Future.delayed(
        Duration(milliseconds: 2),
        () {
          Get.offAllNamed(AppPages.main);
        },
      );
      updateUserStream();
    } catch (e) {
      Get.snackbar(
        'Fallo',
        'No puede ingresar, revise $e',
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  // void RegisterWithEmailAndPassword() async {}

//SignOUT
  void _signOut() async {
    await auth.signOut();
    dispose();
  }

  void signOut() async {
    // final LandingPageController landingPageController;
    final User? user = await auth.currentUser;

    if (user == null) {
      Get.snackbar('Out', 'No One has signed in.',
          snackPosition: SnackPosition.TOP);
      Get.offAllNamed(AppPages.main);
      return;
    }
    _signOut();
    updateUserStream();
    final String nombreUsuario = user.displayName.toString();
    Get.snackbar('Out', nombreUsuario + ' has successfully signed out.',
        snackPosition: SnackPosition.TOP);
    Get.offAllNamed(AppPages.main);
    // landingPageController.changeTabIndex(1);
    //change navbar
    // Builder(
    //   builder: (BuildContext context) {
    //     // final screenHeight = MediaQuery.of(context).size.height;

    //     return SignInScreen();
    //   },
    // );
  }

  void facebookSignInMethod() async {
    // print('facebook');
    // final facebookLoginResult = await FacebookAuth.instance.login();
    // final userData = await FacebookAuth.instance.getUserData();
    // final facebookAuthCredential =
    //     FacebookAuthProvider.credential(facebookLoginResult.accessToken!.token);
    try {
      print('facebook');
      final facebookLoginResult = await FacebookAuth.instance.login();
      // final userData = await FacebookAuth.instance.getUserData();
      final facebookAuthCredential = FacebookAuthProvider.credential(
          facebookLoginResult.accessToken!.token);
      await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential)
          .then((value) => print('Facebook initial '));
      Future.delayed(
        Duration(milliseconds: 2),
        (() async {
          final snapShot = await FirebaseFirestore.instance
              .collection('users')
              .doc(auth.currentUser!.uid) // varuId in your case
              .get();

          if (!snapShot.exists) {
            print('no user exists');
            // Document with id == varuId doesn't exist.
            FirebaseFirestore.instance
                .collection('users')
                // .doc(auth.currentUser!.uid)
                .doc(auth.currentUser!.uid)
                // .collection('userProfile')
                .set({
                  'uid': auth.currentUser!.uid,
                  'createdOn': DateTime.now(),
                  'modifiedOn': DateTime.now(),
                  'lastLogInOn': DateTime.now(),
                  'nombre': auth.currentUser!.displayName,
                  'correo': auth.currentUser!.email,
                  'maestro': false,
                  'dirrecciones': null,
                  'antecedentes': null,
                  'foto': auth.currentUser!.photoURL,
                  'primerApellido': null,
                  'segundoApellido': null,
                  'rut': null,
                  'numeroDeSerie': null,
                  'estadoDeChat': null,
                  'acumuladoRatingUsuario': null,
                  'cantiadadTrabajosUsuario': null,
                  'acumuladoRatingMaestro': null,
                  'cantiadadTrabajosMaestro': null,
                  'genero': null,
                  'cumpleanos': null,
                  'phone': null,
                  'iniciado': null,
                  'status': 'Available',
                  'numeroTelefono': '',
                  'aboutMe': '',
                  'nickname': auth.currentUser!.displayName,
                  'chattingWith': [],
                  'pushToken': [],
                })
                .then((value) => print('First Time LogIn Facebook'))
                .then((value) {
                  Get.offNamed(AppPages.main);
                  // Get.offAll(Text1Screen);
                })
                .then(
                  (value) {
                    // LandingPageController().registerNotification();
                  },
                );
            // You can add data to Firebase Firestore here
          } else {
            FirebaseFirestore.instance
                .collection('users')
                .doc(auth.currentUser!.uid)
                .update({'lastLogInOn': DateTime.now()}).then((value) {
              Get.offAllNamed(AppPages.main);
              // Get.offAll(Text2Screen);
            }).then(
              (value) {
                // LandingPageController().registerNotification();
              },
            );
          }
          updateUserStream();
        }),
      );
    } catch (e) {
      Get.snackbar('Fallo', 'Failed to sign in with Facebook: $e',
          snackPosition: SnackPosition.TOP);
      print(e);
    }
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
      userCredential = await auth.signInWithCredential(googleAuthCredential);
      final user = userCredential.user;
      Get.snackbar('Hola', 'Inicio sesion con ${user!.displayName} con Google');
      // print(user.displayName);
      // print(user.email);
      // print(user.emailVerified);
      // print(user.photoURL);
      // print(user.uid);
      Future.delayed(
        Duration(milliseconds: 2),
        (() async {
          final snapShot = await FirebaseFirestore.instance
              .collection('users')
              .doc(auth.currentUser!.uid) // varuId in your case
              .get();

          if (!snapShot.exists) {
            print('object');
            // Document with id == varuId doesn't exist.
            FirebaseFirestore.instance
                .collection('users')
                // .doc(auth.currentUser!.uid)
                .doc(auth.currentUser!.uid)
                // .collection('userProfile')
                .set({
                  'uid': auth.currentUser!.uid,
                  'createdOn': DateTime.now(),
                  'modifiedOn': DateTime.now(),
                  'lastLogInOn': DateTime.now(),
                  'nombre': auth.currentUser!.displayName,
                  'correo': auth.currentUser!.email,
                  'maestro': false,
                  'dirrecciones': null,
                  'antecedentes': null,
                  'foto': auth.currentUser!.photoURL,
                  'primerApellido': null,
                  'segundoApellido': null,
                  'rut': null,
                  'numeroDeSerie': null,
                  'estadoDeChat': null,
                  'acumuladoRatingUsuario': null,
                  'cantiadadTrabajosUsuario': null,
                  'acumuladoRatingMaestro': null,
                  'cantiadadTrabajosMaestro': null,
                  'genero': null,
                  'cumpleanos': null,
                  'phone': null,
                  'iniciado': null,
                  'status': 'Available',
                  'numeroTelefono': '',
                  'aboutMe': '',
                  'nickname': auth.currentUser!.displayName,
                  'chattingWith': [],
                  'pushToken': [],
                })
                .then((value) => print(auth.currentUser!.email.toString()))
                .then((value) {
                  Get.offNamed(AppPages.main);
                  // Get.offAll(Text1Screen);
                })
                .then(
                  (value) {
                    // LandingPageController().registerNotification();
                  },
                );
            // You can add data to Firebase Firestore here
          } else {
            FirebaseFirestore.instance
                .collection('users')
                .doc(auth.currentUser!.uid)
                .update(
              {'lastLogInOn': DateTime.now()},
            ).then((value) {
              Get.offAllNamed(AppPages.main);
            }).then(
              (value) {
                // LandingPageController().registerNotification();
              },
            );
          }
          updateUserStream();
        }),
      );
    } catch (e) {
      Get.snackbar('Fallo', 'Failed to sign in with Google: $e',
          snackPosition: SnackPosition.TOP);
      print(e);
    }
  }

  void sendpasswordresetemail() async {
    try {
      await auth
          .sendPasswordResetEmail(email: emailController.text)
          .then((value) {
        Get.offAllNamed(AppPages.main);
        Get.snackbar("Password Reset email link is been sent", "Success",
            snackPosition: SnackPosition.TOP);
      });
    } catch (e) {
      Get.snackbar('Fallo', '$e', snackPosition: SnackPosition.TOP);
    }
  }

  // Future verifyPhoneNumber(phoneNumber) async {
  //   auth.verifyPhoneNumber(
  //     phoneNumber: phoneNumber,
  //     verificationCompleted: (phonesAuthCredentials) async {},
  //     verificationFailed: (verificationFailed) async {},
  //     codeSent: codeSent,
  //     codeAutoRetrievalTimeout: (verificationId) async {},
  //   );
  // }

  void signInWithApple() async {
    try {
      UserCredential userCredential;

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final OAuthCredential appleAuthCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      userCredential = await auth.signInWithCredential(appleAuthCredential);
      final user = userCredential.user;
      Get.snackbar('Hola', 'Inicio sesion con ${user!.displayName} con Apple');
      print('Ingreso Bien');
      print(user.displayName);
      print(user.email);
      print(user.emailVerified);
      print(user.photoURL);
      print(user.uid);
      Future.delayed(
        Duration(milliseconds: 2),
        (() async {
          final snapShot = await FirebaseFirestore.instance
              .collection('users')
              .doc(auth.currentUser!.uid) // varuId in your case
              .get();

          if (!snapShot.exists) {
            print('object');
            // Document with id == varuId doesn't exist.
            FirebaseFirestore.instance
                .collection('users')
                // .doc(auth.currentUser!.uid)
                .doc(auth.currentUser!.uid)
                // .collection('userProfile')
                .set({
                  'uid': auth.currentUser!.uid,
                  'createdOn': DateTime.now(),
                  'modifiedOn': DateTime.now(),
                  'lastLogInOn': DateTime.now(),
                  'nombre': auth.currentUser!.displayName,
                  'correo': auth.currentUser!.email,
                  'maestro': false,
                  'dirrecciones': null,
                  'antecedentes': null,
                  'foto': auth.currentUser!.photoURL,
                  'primerApellido': null,
                  'segundoApellido': null,
                  'rut': null,
                  'numeroDeSerie': null,
                  'estadoDeChat': null,
                  'acumuladoRatingUsuario': null,
                  'cantiadadTrabajosUsuario': null,
                  'acumuladoRatingMaestro': null,
                  'cantiadadTrabajosMaestro': null,
                  'genero': null,
                  'cumpleanos': null,
                  'phone': null,
                  'iniciado': null,
                  'status': 'Available',
                  'numeroTelefono': '',
                  'aboutMe': '',
                  'nickname': auth.currentUser!.displayName,
                  'chattingWith': [],
                  'pushToken': [],
                  // 'verificacionCorreo': false,
                })
                .then((value) => print('1'))
                .then((value) {
                  Get.offAllNamed(AppPages.main);
                })
                .then(
                  (value) {
                    // LandingPageController().registerNotification();
                  },
                );
            // You can add data to Firebase Firestore here
          } else {
            FirebaseFirestore.instance
                .collection('users')
                .doc(auth.currentUser!.uid)
                .update({'lastLogInOn': DateTime.now()}).then((value) {
              Get.offNamed(AppPages.main);
            }).then(
              (value) {
                // LandingPageController().registerNotification();
              },
            );
          }
          updateUserStream();
          // Get.offAllNamed(AppPages.verified);
          // dispose();
          // Get.deleteAll();

          // Get.put(
          //   AppPages.verified,
          //   permanent: false,
          // );
        }),
      );
    } catch (e) {
      Get.snackbar('Fallo', 'Failed to sign in with Apple: $e',
          snackPosition: SnackPosition.TOP);
      print(e);
    }
  }
}
