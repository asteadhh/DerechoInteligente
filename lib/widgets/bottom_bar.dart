import 'package:get/get.dart';

import '../controllers/TextoHovering/texto_hovering_controller.dart';
import '../routes/app_pages.dart';
import '/widgets/bottom_bar_column.dart';
import '/widgets/info_text.dart';
import '/widgets/responsive.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final TextoHoveringController controller =
      Get.put<TextoHoveringController>(TextoHoveringController());
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
                    Nosotros_Widget(),
                    HelpWidget(),
                    SocialMediaWidget(),
                  ],
                ),
                Container(
                  color: Colors.blueGrey,
                  width: double.maxFinite,
                  height: 1,
                ),
                SizedBox(height: 20),
                ContactDetails(),
                SizedBox(height: 20),
                LegalWidget(),
                SizedBox(height: 20),
                Container(
                  color: Colors.blueGrey,
                  width: double.maxFinite,
                  height: 1,
                ),
                SizedBox(height: 20),
                Copyright(),
              ],
            )
          : Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Nosotros_Widget(),
                    HelpWidget(),
                    SocialMediaWidget(),
                    LegalWidget(),
                    Container(
                      color: Colors.blueGrey,
                      width: 2,
                      height: 150,
                    ),
                    ContactDetails(),
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
                Copyright(),
              ],
            ),
    );
  }
}

class Copyright extends StatelessWidget {
  const Copyright({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Copyright © 2022 | Derecho Inteligente',
      style: TextStyle(
        color: Colors.blueGrey[300],
        fontSize: 14,
      ),
    );
  }
}

class ContactDetails extends StatelessWidget {
  const ContactDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
          text: 'Apoquindo 5950, Las Condes, RM, Chile',
          link: 'https://goo.gl/maps/xhwWcg6XSnbxhhGB7',
        ),
      ],
    );
  }
}

class SocialMediaWidget extends StatelessWidget {
  SocialMediaWidget({
    super.key,
  });

  final TextoHoveringController controller =
      Get.put<TextoHoveringController>(TextoHoveringController());
  @override
  Widget build(BuildContext context) {
    return BottomBarColumn(
      hoveringNumber: 0,
      heading: 'Social'.tr,
      s1: 'twitter'.tr,
      s1Link: 'https://twitter.com/DerInteligente',
      s2: 'facebook'.tr,
      s2Link: 'https://www.facebook.com/profile.php?id=100090427900495',
      s3: 'youtube'.tr,
      s3Link: 'https://www.youtube.com/channel/UCMIAQIW5EGGCPvWV-C8rpVw',
    );
  }
}

class HelpWidget extends StatelessWidget {
  const HelpWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomBarColumn(
      hoveringNumber: 1,
      heading: 'help'.tr,
      s1: 'payment'.tr,
      s1Page: () {
        Get.offAllNamed(AppPages.pagosScreen);
      },
      s2: 'cancellation'.tr,
      s2Page: () {
        Get.offAllNamed(AppPages.cancelar);
      },
      s3: 'faq'.tr,
      s3Page: () {
        Get.offAllNamed(AppPages.faq);
      },
    );
  }
}

class LegalWidget extends StatelessWidget {
  const LegalWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomBarColumn(
      hoveringNumber: 4,
      heading: 'legal'.tr,
      s1: 'privacyPolicy'.tr,
      s1Page: () {
        Get.offAllNamed(AppPages.privacyPolicy);
      },
      s2: 'termsOfService'.tr,
      s2Page: () {
        Get.offAllNamed(AppPages.termsOfService);
      },
      s3: 'warranty'.tr,
      s3Page: () {
        Get.offAllNamed(AppPages.warranty);
      },
    );
  }
}

class Nosotros_Widget extends StatelessWidget {
  const Nosotros_Widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomBarColumn(
      hoveringNumber: 2,
      heading: 'about'.tr,
      // heading: TextoHovering(
      //   funcion: () {},
      //   hoveringNumber: 1,
      //   texto: 'ff',
      // ),
      s1: 'contactUs'.tr,
      s1Page: () {
        Get.offAllNamed(AppPages.contactUS);
      },
      s2: 'aboutUs'.tr,
      s2Page: () {
        Get.offAllNamed(AppPages.aboutUs);
      },
      s3: 'carreers'.tr,
      s3Page: () {
        Get.offAllNamed(AppPages.postulaciones);
      },
    );
  }
}
