import 'package:get/get.dart';

import '../routes/app_pages.dart';
import '/widgets/bottom_bar_column.dart';
import '/widgets/info_text.dart';
import '/widgets/responsive.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      color: Theme.of(context).bottomAppBarColor,
      child: ResponsiveWidget.isSmallScreen(context)
          ? Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomBarColumn(
                      heading: 'about'.tr,
                      s1: 'contactUs'.tr,
                      s1Page: () {
                        Get.offNamed(AppPages.contactUS);
                      },
                      s2: 'aboutUs'.tr,
                      s2Page: () {
                        Get.offNamed(AppPages.aboutUs);
                      },
                      s3: 'carreers'.tr,
                      s3Page: () {
                        Get.offNamed(AppPages.postulaciones);
                      },
                    ),
                    BottomBarColumn(
                      heading: 'help'.tr,
                      s1: 'payment'.tr,
                      s1Page: () {
                        Get.offNamed(AppPages.pagosScreen);
                      },
                      s2: 'cancellation'.tr,
                      s2Page: () {
                        Get.offNamed(AppPages.cancelar);
                      },
                      s3: 'faq'.tr,
                      s3Page: () {
                        Get.offNamed(AppPages.faq);
                      },
                    ),
                    BottomBarColumn(
                      heading: 'Social'.tr,
                      s1: 'twitter'.tr,
                      s1Link: 'https://twitter.com/DerInteligente',
                      s2: 'facebook'.tr,
                      s2Link:
                          'https://www.facebook.com/profile.php?id=100090427900495',
                      s3: 'youtube'.tr,
                      s3Link:
                          'https://www.youtube.com/channel/UCMIAQIW5EGGCPvWV-C8rpVw',
                    ),
                  ],
                ),
                Container(
                  color: Colors.blueGrey,
                  width: double.maxFinite,
                  height: 1,
                ),
                SizedBox(height: 20),
                InfoText(
                  type: 'correo'.tr,
                  text: 'contacto@derechointeligente.cl',
                  link:
                      'mailto:contacto@derechointeligente.cl?subject=Contacto&body=Quiero Contactarme ',
                ),
                SizedBox(height: 5),
                InfoText(
                  type: 'Address',
                  text: 'Apoquindo 5950, Las Condes, RM, Chile',
                  link: 'https://goo.gl/maps/xhwWcg6XSnbxhhGB7',
                ),
                SizedBox(height: 20),
                Container(
                  color: Colors.blueGrey,
                  width: double.maxFinite,
                  height: 1,
                ),
                SizedBox(height: 20),
                Text(
                  'Copyright © 2022 | Derecho Inteligente SpA',
                  style: TextStyle(
                    color: Colors.blueGrey[300],
                    fontSize: 14,
                  ),
                ),
              ],
            )
          : Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomBarColumn(
                      heading: 'about'.tr,
                      s1: 'contactUs'.tr,
                      s1Page: () {
                        Get.offNamed(AppPages.contactUS);
                      },
                      s2: 'aboutUs'.tr,
                      s2Page: () {
                        Get.offNamed(AppPages.aboutUs);
                      },
                      s3: 'carreers'.tr,
                    ),
                    BottomBarColumn(
                      heading: 'help'.tr,
                      s1: 'payment'.tr,
                      s2: 'cancellation'.tr,
                      s3: 'faq'.tr,
                    ),
                    BottomBarColumn(
                      heading: 'Social'.tr,
                      s1: 'twitter'.tr,
                      s1Link: 'https://www.pulpox.cl',
                      s2: 'facebook'.tr,
                      s2Link:
                          'https://www.facebook.com/profile.php?id=100087947412598',
                      s3: 'youtube'.tr,
                    ),
                    Container(
                      color: Colors.blueGrey,
                      width: 2,
                      height: 150,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InfoText(
                          type: 'correo'.tr,
                          text: 'contacto@derechointeligente.cl',
                          link:
                              'mailto:contacto@derechointeligente.cl?subject=Contacto&body=Quiero Contactarme ',
                        ),
                        SizedBox(height: 5),
                        InfoText(
                          type: 'Dirreción',
                          text: '128, Trymore Road, Delft, MN - 56124',
                        )
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.blueGrey,
                    width: double.maxFinite,
                    height: 1,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Copyright © 2022 | Derecho Inteligente',
                  style: TextStyle(
                    color: Colors.blueGrey[300],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
    );
  }
}
