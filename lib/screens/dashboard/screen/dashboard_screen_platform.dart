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
