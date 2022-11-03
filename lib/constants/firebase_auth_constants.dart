import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseAuth authController = FirebaseAuth.instance;
final Future<FirebaseApp> firebaseInitialization = Firebase.initializeApp();
FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
GoogleSignIn googleSign = GoogleSignIn();
Future userDataGet = FirebaseFirestore.instance
    .collection('users')
    .doc(auth.currentUser!.uid)
    .get();
Stream userDataStream = FirebaseFirestore.instance
    .collection('users')
    .doc(auth.currentUser!.uid)
    .snapshots();
