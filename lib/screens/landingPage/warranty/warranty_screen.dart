import 'package:flutter/material.dart';

import '../base/home_page_landing.dart';

class WarrantyScreen extends StatelessWidget {
  const WarrantyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LandingPageBase(
      widget: Column(
        children: [
          Container(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/images/cover.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text('Warranty'),
        ],
      ),
    );
  }
}
