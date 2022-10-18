import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulpox_admin/screens/landingPage/contactUs/contact_us_screen.dart';
import 'package:pulpox_admin/screens/landingPage/help/help_screen.dart';

import '../../components/background.dart';
import '../../controllers/menu_landing_page_controller.dart';
import '../../responsive.dart';
import '../landingPage/Login/components/login_form.dart';
import '../landingPage/Login/components/login_screen_top_image.dart';
import '../landingPage/Login/login_screen.dart';
import '../landingPage/Signup/signup_screen.dart';
import '../landingPage/aboutUs/aboutUs_screen.dart';
import '../landingPage/main/main_screen.dart';
import '../landingPage/menu.dart';
import '../plataforma/main/components/landing_page_drawer.dart';

class WelcomeScreen extends GetView<MenuLandingPageController> {
  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => MenuLandingPageController());
    return Background(
      child: SafeArea(
        child: Responsive(
          desktop: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: MenuLandingPage(),
              ),
              SingleChildScrollView(
                child: Obx(
                  () => IndexedStack(
                    index: controller.tabIndex.value,
                    children: [
                      MainScreen(),
                      AboutUsScreen(),
                      ContactUsScreen(),
                      HelpScreen(),
                      LoginScreen(),
                      // Container(
                      //   child: Text('dd'),
                      // ),
                      SignUpScreen(),
                    ],
                  ),
                ),
                // child: DesktopWelcomeScreen(),
              ),
            ],
          ),
          mobile: Scaffold(
            appBar: AppBar(),
            drawer: LandingPageDrawer(),
            body: SingleChildScrollView(
              child: Obx(
                () => IndexedStack(
                  index: controller.tabIndex.value,
                  children: [
                    MainScreen(),
                    AboutUsScreen(),
                    ContactUsScreen(),
                    HelpScreen(),
                    LoginScreen(),
                    // Container(
                    //   child: Text('dd'),
                    // ),
                    SignUpScreen(),
                  ],
                ),
              ),
              // child: DesktopWelcomeScreen(),
            ),
            // body: SingleChildScrollView(

            //     // child: MobileWelcomeScreen(),
            //     ),
          ),
        ),
      ),
    );
  }
}

class LoginDesktop extends StatelessWidget {
  const LoginDesktop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
              child: LoginScreenTopImage(),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(
                    width: 450,
                    child: LoginForm(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
