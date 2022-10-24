import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class MenuPlatformController extends GetxController {
  RxBool isProcessing = false.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  var tabIndex = 0.obs;

  void platformEnabledIndex(int index) {
    // platformEnabled = index;
    tabIndex.value = index;
  }
}
