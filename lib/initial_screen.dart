import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'screens/login/auth_screen.dart';
import 'screens/onboarding/onboarding.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        final screenHeight = MediaQuery.of(context).size.height;

        return kIsWeb
            ? Login(screenHeight: screenHeight)
            : Onboarding(
                screenHeight: screenHeight,
              );
      },
    );
  }
}
