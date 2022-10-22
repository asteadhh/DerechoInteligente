import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../models/user_chat.dart';

class MenuController extends GetxController {
  RxBool isProcessing = false.obs;

  final RxList isHovering =
      [false, false, false, false, false, false, false, false].obs;
}
