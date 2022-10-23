import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
      // return AuthDialogContentMobile();

      return LandingPageBase(
        widget: HomeLandingContent(),
      );
    } else {
      // return AuthDialogContentMobile();

      return LandingPageBase(
        widget: HomeLandingContent(),
      );
    }
  }
}
