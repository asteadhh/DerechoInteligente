import 'package:flutter/material.dart';
import '/screens/dashboard/content/CreditosMaestros/creditos_maestros_content.dart';
import '/screens/dashboard/content/dashboardContent/dashboard_content.dart';
import '/screens/dashboard/content/estadisticas/estadisticas_content.dart';
import '/screens/dashboard/content/informacionDeUsuarios/informacion_de_usuarios_content.dart';
import '/screens/dashboard/content/pagos/pagos_content.dart';
import '/screens/dashboard/content/revenue/estadisticas_content.dart';

import '../../plataforma/main/template_platform_screen.dart';
import '../content/chatSoporte/chat_soporte.dart';

class PlatformAdminMainScreen extends StatelessWidget {
  const PlatformAdminMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformAdminTemplateScreen(
      contentWidget: DashboardContent(),
      templateName: 'Dashboard',
    );
  }
}

class ChatSoporteScreen extends StatelessWidget {
  const ChatSoporteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformAdminTemplateScreen(
      contentWidget: ChatSoporteContent(),
      templateName: 'Chat Soporte',
    );
  }
}

class EstadisticasScreen extends StatelessWidget {
  const EstadisticasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformAdminTemplateScreen(
      contentWidget: EstadisticasContent(),
      templateName: 'Estadisticas',
    );
  }
}

class RevenueScreen extends StatelessWidget {
  const RevenueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformAdminTemplateScreen(
      contentWidget: RevenueContent(),
      templateName: 'Revenue',
    );
  }
}

class InformacionUsuarioScreen extends StatelessWidget {
  const InformacionUsuarioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformAdminTemplateScreen(
      contentWidget: InformacionDeUsuarioContent(),
      templateName: 'Informacion Usuarios',
    );
  }
}

class CreditosMaestrosScreen extends StatelessWidget {
  const CreditosMaestrosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformAdminTemplateScreen(
      contentWidget: CreditosMaestrosContent(),
      templateName: 'Creditos Maestros',
    );
  }
}

class OnBoardingMaestrosScreen extends StatelessWidget {
  const OnBoardingMaestrosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformAdminTemplateScreen(
      contentWidget: CreditosMaestrosContent(),
      templateName: 'On Boarding Maestros',
    );
  }
}

class PagosScreen extends StatelessWidget {
  const PagosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformAdminTemplateScreen(
      contentWidget: PagosContent(),
      templateName: 'Pagos',
    );
  }
}
