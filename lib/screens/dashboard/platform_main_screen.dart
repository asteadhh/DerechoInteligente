import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pulpox_admin/screens/dashboard/content/CreditosMaestros/creditos_maestros_content.dart';
import 'package:pulpox_admin/screens/dashboard/content/estadisticas/estadisticas_content.dart';
import 'package:pulpox_admin/screens/dashboard/content/informacionDeUsuarios/informacion_de_usuarios_content.dart';
import 'package:pulpox_admin/screens/dashboard/content/onBoardingMaestro/onBoarding_maestro.dart';
import 'package:pulpox_admin/screens/dashboard/content/pagos/pagos_content.dart';
import 'package:pulpox_admin/screens/dashboard/content/revenue/estadisticas_content.dart';

import '../../constants.dart';
import '../../controllers/MenuController.dart';
import 'content/components/header.dart';

import 'content/dashboardContent/dashboard_content.dart';

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
            // Obx(
            //   () => IndexedStack(
            //     index: menuPlatformController.tabIndex.value,
            //     children: [
            //       DashboardContent(),
            //       ChatContent(),
            //       EstadisticasContent(),
            //       RevenueContent(),
            //       InformacionDeUsuarioContent(),
            //       CreditosMaestrosContent(),
            //       OnBoardingMaestroContent(),
            //       PagosContent(),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class ChatContent extends StatelessWidget {
  const ChatContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
