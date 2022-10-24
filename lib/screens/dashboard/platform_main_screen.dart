import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pulpox_admin/screens/dashboard/CreditosMaestros/creditos_maestros_content.dart';
import 'package:pulpox_admin/screens/dashboard/estadisticas/estadisticas_content.dart';
import 'package:pulpox_admin/screens/dashboard/informacionDeUsuarios/informacion_de_usuarios_content.dart';
import 'package:pulpox_admin/screens/dashboard/onBoardingMaestro/onBoarding_maestro.dart';
import 'package:pulpox_admin/screens/dashboard/pagos/pagos_content.dart';
import 'package:pulpox_admin/screens/dashboard/revenue/estadisticas_content.dart';

import '../../constants.dart';
import '../../controllers/MenuController.dart';
import 'components/header.dart';

import '/responsive.dart';
import '/screens/dashboard/components/my_fields.dart';
import 'components/storage_details.dart';
import 'dashboardContent/dashboard_content.dart';

class DashboardScreen extends StatelessWidget {
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
            Header(),
            SizedBox(height: defaultPadding),
            Obx(
              () => IndexedStack(
                index: menuPlatformController.tabIndex.value,
                children: [
                  DashboardContent(),
                  ChatContent(),
                  EstadisticasContent(),
                  RevenueContent(),
                  InformacionDeUsuarioContent(),
                  CreditosMaestrosContent(),
                  OnBoardingMaestroContent(),
                  PagosContent(),
                ],
              ),
            ),
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
