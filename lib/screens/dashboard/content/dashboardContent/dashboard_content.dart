import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../responsive.dart';
import '../components/my_files.dart';
import '../components/storage_details.dart';

class DashboardContent extends StatelessWidget {
  const DashboardContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 5,
          child: Column(
            children: [
              MyFiles(),
              SizedBox(height: defaultPadding),
              // RecentFiles(),
              if (Responsive.isMobile(context))
                SizedBox(height: defaultPadding),
              if (Responsive.isMobile(context)) StarageDetails(),
            ],
          ),
        ),
        if (!Responsive.isMobile(context)) SizedBox(width: defaultPadding),
        // On Mobile means if the screen is less than 850 we dont want to show it
        if (!Responsive.isMobile(context))
          Expanded(
            flex: 2,
            child: StarageDetails(),
          ),
      ],
    );
  }
}
