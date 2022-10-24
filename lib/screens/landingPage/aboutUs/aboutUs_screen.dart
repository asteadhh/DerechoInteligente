import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pulpox_admin/controllers/LoginController/login_controller.dart';

import '../base/home_page_landing.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LandingPageBase(
      widget: Column(
        children: [
          Container(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/images/cover.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Text('Imprimir Correo en'),

          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              print(LoginController().myUser?.correo);
            },
            child: Text('Imprimir Correo en Stream'),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              print(FirebaseAuth.instance.currentUser!.email);
            },
            child: Text('Imprimir Correo en Firebase'),
          )
        ],
      ),
    );
  }
}
