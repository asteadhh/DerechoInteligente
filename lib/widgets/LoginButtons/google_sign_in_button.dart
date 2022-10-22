import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../controllers/MenuController.dart';
import '../../routes/app_pages.dart';
import '/screens/home_page.dart';
import '/utils/authentication.dart';
import 'package:flutter/material.dart';

class GoogleButton extends GetView<MenuController> {
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
          controller.isProcessing.value = true;
          // });
          // LoginController().signInWithGoogle();

          await signInWithGoogle().then((result) {
            print(result);
            if (result != null) {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (context) => Home(),
                ),
              );
            }
            Future.delayed(
              Duration(milliseconds: 2),
              (() async {
                final snapShot = await FirebaseFirestore.instance
                    .collection('users')
                    .doc(FirebaseAuth
                        .instance.currentUser!.uid) // varuId in your case
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
                        'chattingWith': [],
                        'pushToken': [],
                      })
                      .then((value) => print(
                          FirebaseAuth.instance.currentUser!.email.toString()))
                      .then((value) {
                        Get.offNamed(AppPages.platform);
                        // Get.offAll(Text1Screen);
                      })
                      .then((value) {
                        // LandingPageController().registerNotification(),
                      });
                  // You can add data to Firebase Firestore here
                } else {
                  FirebaseFirestore.instance
                      .collection('users')
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .update(
                    {'lastLogInOn': DateTime.now()},
                  ).then((value) {
                    MenuController().isProcessing.value = false;
                    Get.offAllNamed(AppPages.platform);
                  }).then(
                    (value) {
                      // LandingPageController().registerNotification();
                    },
                  );
                }
              }),
            );
          }).catchError((error) {
            print('Registration Error: $error');
          });
          // setState(() {

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
                      image: AssetImage("assets/images/google_logo.png"),
                      height: 30.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'Continue with Google',
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
