import 'package:flutter/material.dart';

import 'landingPage/base/home_page_landing.dart';
import 'landingPage/main/main_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return LandingPageBase(
      widget: HomeLandingContent(),
    );
  }
}
