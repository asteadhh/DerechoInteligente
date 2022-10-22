import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';

import '../../constants/custom_colors.dart';
import '../../controllers/MenuController.dart';
import '../../controllers/login/login_controller.dart';
import '../../routes/app_pages.dart';
import '/screens/home_page.dart';
import '/utils/authentication.dart';
import 'package:flutter/material.dart';

class FacebookButton extends StatefulWidget {
  @override
  _FacebookButtonState createState() => _FacebookButtonState();
}

class _FacebookButtonState extends State<FacebookButton> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.blueGrey, width: 3),
        ),
        color: Colors.white,
      ),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          primary: Colors.blueGrey.shade100,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Colors.blueGrey, width: 3),
          ),
          elevation: 0,
        ),
        onPressed: () async {
          // setState(() {
          MenuController().isProcessing.value = true;
          // });

//

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
                    .doc(FirebaseAuth
                        .instance.currentUser!.uid) // varuId in your case
                    .get();

                if (!snapShot.exists) {
                  print('no user exists');
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
                        'nombre':
                            FirebaseAuth.instance.currentUser!.displayName,
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
                        'nickname':
                            FirebaseAuth.instance.currentUser!.displayName,
                      })
                      .then((value) => print('First Time LogIn Facebook'))
                      .then((value) {
                        Get.offNamed(AppPages.platform);
                        // Get.offAll(Text1Screen);
                      });
                  // You can add data to Firebase Firestore here
                } else {
                  FirebaseFirestore.instance
                      .collection('users')
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .update({'lastLogInOn': DateTime.now()}).then((value) {
                    Get.offAllNamed(AppPages.platform);
                    // Get.offAll(Text2Screen);
                  });
                }
              }),
            );
          } catch (e) {
            Get.snackbar('Fallo', 'Failed to sign in with Facebook: $e',
                snackPosition: SnackPosition.TOP);
            print(e);
          }

//
          // LoginController().signInWithGoogle();
          // await signInWithGoogle().then((result) {
          //   print(result);
          //   if (result != null) {
          //     Navigator.of(context).pop();
          //     Navigator.of(context).pushReplacement(
          //       MaterialPageRoute(
          //         fullscreenDialog: true,
          //         builder: (context) => Home(),
          //       ),
          //     );
          //   }
          // }).catchError((error) {
          //   print('Registration Error: $error');
          // });
          // setState(() {
          MenuController().isProcessing.value = false;
          // });
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: MenuController().isProcessing.value
              ? CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(
                    Colors.blueGrey,
                  ),
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage("assets/images/facebook.png"),
                      height: 30.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'Continue with Facebook',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blueGrey,
                        ),
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
