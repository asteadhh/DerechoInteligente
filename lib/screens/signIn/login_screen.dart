import 'package:flutter/material.dart';

import '../landingPage/menu.dart';
import 'sign_in_screen.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf5f5f5),
      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 8),
        children: [
          // Menu(),
          MediaQuery.of(context).size.width >= 980
              ? MenuLandingPage()
              : SizedBox(), // Responsive
          SignInBody()
        ],
      ),
    );
  }
}
