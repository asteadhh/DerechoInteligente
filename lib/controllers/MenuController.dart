import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuPlatformController extends GetxController {
  RxBool isProcessing = false.obs;

  var tabIndex = 0.obs;

  @override
  void onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getInt('platformIndex') == null) {
      print('No Platform Enabled Index Saved ');
    } else {
      print('Platform Enabled Index Saved ${prefs.getInt('platformIndex')}');
      tabIndex.value = prefs.getInt('platformIndex')!;
    }
    super.onInit();
  }

  platformEnabledIndex(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // platformEnabled = index;
    tabIndex.value = index;
    await prefs.setInt('platformIndex', index);
    print('Platform Enabled Index : ${prefs.getInt('platformIndex')}');
  }
}
