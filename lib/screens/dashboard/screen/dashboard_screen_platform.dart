import 'package:flutter/material.dart';
import 'package:pulpox_admin/screens/dashboard/content/dashboardContent/dashboard_content.dart';

import '../../plataforma/main/template_platform_screen.dart';

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
      contentWidget: ChatSoporteScreen(),
      templateName: 'Chat Soporte',
    );
  }
}

class EstadisticasScreen extends StatelessWidget {
  const EstadisticasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformAdminTemplateScreen(
      contentWidget: EstadisticasScreen(),
      templateName: 'Estadisticas',
    );
  }
}

class RevenueScreen extends StatelessWidget {
  const RevenueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformAdminTemplateScreen(
      contentWidget: RevenueScreen(),
      templateName: 'Revenue',
    );
  }
}

class InformacionUsuarioScreen extends StatelessWidget {
  const InformacionUsuarioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformAdminTemplateScreen(
      contentWidget: InformacionUsuarioScreen(),
      templateName: 'Informacion Usuarios',
    );
  }
}

class CreditosMaestrosScreen extends StatelessWidget {
  const CreditosMaestrosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformAdminTemplateScreen(
      contentWidget: CreditosMaestrosScreen(),
      templateName: 'Creditos Maestros',
    );
  }
}

class OnBoardingMaestrosScreen extends StatelessWidget {
  const OnBoardingMaestrosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformAdminTemplateScreen(
      contentWidget: CreditosMaestrosScreen(),
      templateName: 'On Boarding Maestros',
    );
  }
}

class PagosScreen extends StatelessWidget {
  const PagosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformAdminTemplateScreen(
      contentWidget: CreditosMaestrosScreen(),
      templateName: 'Pagos',
    );
  }
}
