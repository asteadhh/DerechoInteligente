import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sign_button/sign_button.dart';

import '../../../../components/already_have_an_account_acheck.dart';
import '../../../../constants.dart';
import '../../../../constants/custom_colors.dart';
import '../../../../controllers/login/login_controller.dart';
import '../../../../controllers/menu_landing_page_controller.dart';
import '../../../../routes/app_pages.dart';

class LoginForm extends GetView<MenuLandingPageController> {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: Constants.kPrimaryColor,
            onSaved: (email) {},
            decoration: InputDecoration(
              hintText: "Your email",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: Constants.kPrimaryColor,
              decoration: InputDecoration(
                hintText: "Your password",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          Hero(
            tag: "login_btn",
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                "Login".toUpperCase(),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            press: () {
              print('object');
              controller.tabIndex.toString() == '4'
                  ? controller.changeTabIndex(5)
                  : controller.changeTabIndex(4);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) {
              //       return SignUpScreen();
              //     },
              //   ),
              // );
            },
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SignInButton.mini(
                buttonType: ButtonType.google,
                // mini: true,
                onPressed: () {
                  // LoginController().signInWithGoogle();
                },
              ),
              const SizedBox(width: 20),
              SignInButton.mini(
                buttonType: ButtonType.facebook,
                // mini: true,
                onPressed: () {
                  // LoginController().facebookSignInMethod();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
