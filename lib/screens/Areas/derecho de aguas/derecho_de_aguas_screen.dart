import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../widgets/responsive.dart';
import '../../landingPage/base/home_page_landing.dart';
import '../../landingPage/contactUs/alertDialog_widget.dart';
import 'ServiciosPorAreaWidget.dart';

class DerechoDeAguasScreen extends StatelessWidget {
  const DerechoDeAguasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LandingPageBase(
      widget: Column(
        children: [
          SizedBox(
            child: Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.45,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'assets/images/FOTOFREE/iStock-1051502202.jpg',
                    fit: ResponsiveWidget.isSmallScreen(context)
                        ? BoxFit.cover
                        : BoxFit.fitWidth,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.45,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          // primary: Colors.purple,
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          textStyle: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: PlatformText(
                          'Contactanos',
                          style: TextStyle(fontSize: 40),
                        ),
                        onPressed: () {
                          showDialogContactForm(context);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          PlatformText('data'),
          // Servicios()
        ],
      ),
    );
  }
}

class Servicios extends StatelessWidget {
  Servicios({
    super.key,
  });
  List serviciosDerechoDeAguaList = [
    {
      "title": 'Servidumbres',
      "text": 'Esto es una Servidumbre',
      "image": 'assets/images/australia.jpg',
    },
    {
      "title": 'Servidumbres',
      "text": 'Esto es una Servidumbre',
      "image": 'assets/images/australia.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      height: 400,
      child: ListView.builder(
        itemCount: serviciosDerechoDeAguaList.length,
        itemBuilder: (BuildContext ctx, int index) {
          return ServiciosPorArea(
            title: serviciosDerechoDeAguaList[index]['title'],
            text: serviciosDerechoDeAguaList[index]['text'],
            image: serviciosDerechoDeAguaList[index]['image'],
            hooverNumber: index,
          );
        },
      ),
    ));
  }
}
