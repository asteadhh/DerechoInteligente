import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuControllerddd extends GetxController {
  RxBool isProcessing = false.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  String? uid;
  String? name;
  String? userEmail;
  String? imageUrl;

  final RxList isHovering =
      [false, false, false, false, false, false, false, false].obs;

  // var tabIndex = platformEnabled.obs;
  var tabIndex = 0.obs;

  void platformEnabledIndex(int index) {
    // platformEnabled = index;
    tabIndex.value = index;
  }

  /// For checking if the user is already signed into the
  /// app using Google Sign In
  Future getUser() async {
    await Firebase.initializeApp();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool authSignedIn = prefs.getBool('auth') ?? false;

    final User? user = _auth.currentUser;

    if (authSignedIn == true) {
      if (user != null) {
        uid = user.uid;
        name = user.displayName;
        userEmail = user.email;
        imageUrl = user.photoURL;
      }
    }
  }
}
