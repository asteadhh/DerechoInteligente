import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../controllers/MenuController.dart';
import '../../responsive.dart';
import 'content/components/header.dart';

class MainScreenTemplateScreen extends StatelessWidget {
  MainScreenTemplateScreen({
    required this.tabName,
    required this.screenContent,
  });

  var tabName;
  Widget screenContent;
  final MenuPlatformController menuPlatformController =
      Get.put<MenuPlatformController>(MenuPlatformController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(text: tabName),
            SizedBox(height: defaultPadding),
            screenContent,
          ],
        ),
      ),
    );
  }
}
