import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../db/my_user.dart';
import '../../models/user_chat.dart';
import '../../models/user_permitions.dart';
import '../../routes/app_pages.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Rx<UserChatInfo?> myUserData = Rx<UserChatInfo?>(null);
  Rx<UserPermissionInfo?> myUserPermissionData = Rx<UserPermissionInfo?>(null);

  UserChatInfo? get myUser => myUserData.value;
  UserPermissionInfo? get myUserPermitions => myUserPermissionData.value;

  late DocumentSnapshot currentUserData;

  RxBool isProcessing = false.obs;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final posts = [].obs;

  RxString uid = ''.obs;
  RxString name = ''.obs;
  RxString userEmail = ''.obs;
  RxString imageUrl = ''.obs;

  final RxList isHovering =
      [false, false, false, false, false, false, false, false].obs;

  updateUserStream() async {
    var currentUser = auth.currentUser;
    print('UPDATE User Data');
    myUserData.bindStream(await MyUserDB.myUserDataStream(currentUser));
  }

  updateUserPermitionsStream() async {
    var currentUser = auth.currentUser;
    print('UPDATE Permitions');
    myUserPermissionData.bindStream(
        await MyUserPermissionDB.myUserPermissionsStream(currentUser));
    // print(myUserPermitions!.admin);
  }

  @override
  void onInit() async {
    super.onInit();
    await updateUserPermitionsStream();
    await updateUserStream();
  }

  getUser() async {
    await Firebase.initializeApp();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool authSignedIn = prefs.getBool('auth') ?? false;

    final User? user = _auth.currentUser;

    if (authSignedIn == true) {
      if (user != null) {
        await updateUserPermitionsStream();
        await updateUserStream();
      }
    }
  }

  /// For authenticating user using Google Sign In
  /// with Firebase Authentication API.
  ///
  /// Retrieves some general user related information
  /// from their Google account for ease of the login process

  Future<User?> registerWithEmailPassword(String email, String password) async {
    await Firebase.initializeApp();
    User? user;

    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      user = userCredential.user;

      if (user != null) {
        uid.value = user.uid;
        userEmail.value = user.email!;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }

    return user;
  }

  Future<User?> signInWithEmailPassword(String email, String password) async {
    await Firebase.initializeApp();
    User? user;

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;

      if (user != null) {
        uid.value = user.uid;
        userEmail.value = user.email!;

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('auth', true);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided.');
      }
    }

    return user;
  }

  // Future<String> signOut() async {
  //   await _auth.signOut();

  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setBool('auth', false);

  //   uid = null;
  //   userEmail = null;

  //   return 'User signed out';
  // }

  /// For signing out of their Google account
  void signOutGoogle() async {
    await googleSignIn.signOut();
    await _auth.signOut();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('auth', false);

    uid.value = '';
    name.value = '';
    userEmail.value = '';
    imageUrl.value = '';

    print("User signed out of Google account");
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
          // updateUserStream();
        }),
      );
    } catch (e) {
      Get.snackbar('Fallo', 'Failed to sign in with Facebook: $e',
          snackPosition: SnackPosition.TOP);
      print(e);
    }
  }

  Future<User?> signInWithGoogle() async {
    await Firebase.initializeApp();

    User? user;

    if (kIsWeb) {
      GoogleAuthProvider authProvider = GoogleAuthProvider();

      try {
        final UserCredential userCredential =
            await _auth.signInWithPopup(authProvider);

        user = userCredential.user;
      } catch (e) {
        print(e);
      }
    } else {
      final GoogleSignIn googleSignIn = GoogleSignIn();

      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        try {
          final UserCredential userCredential =
              await _auth.signInWithCredential(credential);

          user = userCredential.user;
        } on FirebaseAuthException catch (e) {
          if (e.code == 'account-exists-with-different-credential') {
            print('The account already exists with a different credential.');
          } else if (e.code == 'invalid-credential') {
            print('Error occurred while accessing credentials. Try again.');
          }
        } catch (e) {
          print(e);
        }
      }
    }

    if (user != null) {
      await Future.delayed(
        Duration(milliseconds: 2),
        (() async {
          final snapShot = await FirebaseFirestore.instance
              .collection('users')
              .doc(
                  FirebaseAuth.instance.currentUser!.uid) // varuId in your case
              .get();

          if (!snapShot.exists) {
            print('object');
            // Document with id == varuId doesn't exist.
            FirebaseFirestore.instance
                .collection('users')
                // .doc(auth.currentUser!.uid)
                .doc(FirebaseAuth.instance.currentUser!.uid)
                // .collection('userProfile')
                .set({
                  'uid': FirebaseAuth.instance.currentUser!.uid,
                  'createdOn': DateTime.now(),
                  'modifiedOn': DateTime.now(),
                  'lastLogInOn': DateTime.now(),
                  'nombre': FirebaseAuth.instance.currentUser!.displayName,
                  'correo': FirebaseAuth.instance.currentUser!.email,
                  'maestro': false,
                  'dirrecciones': null,
                  'antecedentes': null,
                  'foto': FirebaseAuth.instance.currentUser!.photoURL,
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
                  'nickname': FirebaseAuth.instance.currentUser!.displayName,
                  'chattingWith': [],
                  'pushToken': [],
                })
                .whenComplete(() => print(
                    'Iniciado por primera vez con Google ${FirebaseAuth.instance.currentUser!.email.toString()}'))
                .whenComplete(() async {
                  await updateUserStream();
                  await updateUserPermitionsStream();
                })
                .whenComplete(() async {
                  await Future.delayed(Duration(seconds: 4));
                  // Get.offAll(Text1Screen);
                })
                .then(
                  (value) {
                    print(
                        'Esta es la foto de google 2${LoginController().myUser?.foto}');
                    // LandingPageController().registerNotification();
                  },
                );
            // You can add data to Firebase Firestore here
          } else {
            FirebaseFirestore.instance
                .collection('users')
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .update(
              {'lastLogInOn': DateTime.now()},
            ).whenComplete(() async {
              await updateUserStream();

              await updateUserPermitionsStream();
              await Future.delayed(Duration(seconds: 4));
            }).then(
              (value) {
                print(
                    'Iniciado con Google ${FirebaseAuth.instance.currentUser!.email.toString()}');
                print('Esta es la foto de google 1 ${myUser?.foto}');
                print('Permisos en google ${myUser?.foto}');
                // LandingPageController().registerNotification();
              },
            );
          }
          // updateUserStream();
        }),
      );

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('auth', true);
    }
    return null;

    // return user;
  }
}
