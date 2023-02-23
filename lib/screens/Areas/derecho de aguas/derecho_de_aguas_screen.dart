import 'package:flutter/material.dart';

import '../../landingPage/base/home_page_landing.dart';

class DerechoDeAguasScreen extends StatelessWidget {
  const DerechoDeAguasScreen({super.key});

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
                'assets/images/FOTOFREE/iStock-1051502202.jpg',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Text('Derecho de Aguas')
        ],
      ),
    );
  }
}
