import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../widgets/auth_dialog/auth_dialog.dart';
import 'dashboard/screen/dashboard_screen_platform.dart';
import 'landingPage/base/home_page_landing.dart';
import 'landingPage/main/main_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      //running on web
      return LandingPageBase(
        widget: HomeLandingContent(),
      );
    } else if (Platform.isAndroid || Platform.isIOS) {
      //running on android or ios device

      if (FirebaseAuth.instance.currentUser != null) {
        // signed in

        return PlatformAdminMainScreen();
      } else {
        return AuthDialogContentMobile();
      }
    } else {
      if (FirebaseAuth.instance.currentUser != null) {
        // signed in

        return PlatformAdminMainScreen();
      } else {
        return AuthDialogContentMobile();
      }
    }
  }
}
