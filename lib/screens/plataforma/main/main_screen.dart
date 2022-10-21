import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../home_page.dart';
import 'components/side_menu.dart';
import '/controllers/MenuController.dart';
import '/responsive.dart';
import '/screens/dashboard/dashboard_screen.dart';

class PlatformAdminMainScreen extends StatefulWidget {
  @override
  State<PlatformAdminMainScreen> createState() =>
      _PlatformAdminMainScreenState();
}

class _PlatformAdminMainScreenState extends State<PlatformAdminMainScreen> {
  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser == null) {
      // return CircularProgressIndicator();
      return Home();
    } else {
      return Scaffold(
        backgroundColor: Theme.of(context).accentColor,
        // key: context.read<MenuController>().scaffoldKey,
        drawer: SideMenuPlatform(),
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // We want this side menu only for large screen
              if (Responsive.isDesktop(context))
                Expanded(
                  // default flex = 1
                  // and it takes 1/6 part of the screen
                  child: SideMenuPlatform(),
                  // child: Container(),
                ),
              Expanded(
                // It takes 5/6 part of the screen
                flex: 5,
                // child: Container(),
                child: DashboardScreen(),
              ),
            ],
          ),
        ),
      );
    }
  }
}
