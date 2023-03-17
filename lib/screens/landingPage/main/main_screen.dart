import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../widgets/bottom_bar.dart';
import '../../../widgets/carousel.dart';
import '../../../widgets/destination_heading.dart';
import '../../../widgets/featured_heading.dart';
import '../../../widgets/featured_tiles.dart';
import '../../../widgets/floating_quick_access_bar.dart';
import '../../../widgets/responsive.dart';
import '../contactUs/alertDialog_widget.dart';

class HomeLanding extends StatelessWidget {
  HomeLanding({
    Key? key,
    required this.content,
  }) : super(key: key);

  Widget content;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        content,
        SizedBox(height: screenSize.height / 10),
        BottomBar(),
      ],
    );
  }
}

class HomeLandingContent extends StatelessWidget {
  HomeLandingContent({
    Key? key,
    // required this.screenSize,
  }) : super(key: key);

  // final Size screenSize;

  final List<String> imgListAsset = [
    'assets/images/FOTOFREE/iStock-1051502202.jpg',
    'assets/images/FOTOFREE/iStock-1147717137.jpg',
    'assets/images/FOTOFREE/iStock-1053312200.jpg',
    'assets/images/FOTOFREE/iStock-1053597112.jpg',
    'assets/images/FOTOFREE/iStock-1058130072.jpg',
    'assets/images/FOTOFREE/iStock-1080092606.jpg',
    'assets/images/FOTOFREE/iStock-1095177180.jpg',
    'assets/images/FOTOFREE/iStock-1124563104.jpg',
    'assets/images/FOTOFREE/iStock-1127947543.jpg',
  ];

  //
  final List<String> imgTextListAsset = [
    'Derecho de Agua',
    'Imagen 2',
    'Imagen 3',
    'Imagen 4',
    'Imagen 5',
    'Imagen 6',
    'Imagen 7',
    'Imagen 8',
    'Imagen 9',
  ];
  var imgPathListAsset = [
    () {
      Get.offAllNamed(AppPages.aguas);
    },
    () {
      print('2');
    },
    () {
      print('3');
    },
    () {
      print('4');
    },
    () {
      print('5');
    },
    () {
      print('6');
    },
    () {
      print('7');
    },
    () {
      print('8');
    },
    () {
      print('9');
    },
  ];
//
  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = imgListAsset
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.only(top: 50, bottom: 5, left: 5, right: 5),
                child: GestureDetector(
                  onTap: () {
                    imgPathListAsset[imgListAsset.indexOf(item)].call();
                    // print('object');
                  },
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      child: Stack(
                        children: <Widget>[
                          Image.asset(item, fit: BoxFit.cover, width: 1000.0),
                          Positioned(
                            bottom: 0.0,
                            left: 0.0,
                            right: 0.0,
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(200, 0, 0, 0),
                                    Color.fromARGB(0, 0, 0, 0)
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20.0),
                              child: PlatformText(
                                '${imgTextListAsset[imgListAsset.indexOf(item)]}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            ))
        .toList();

    return Column(
      children: [
        // Fotos Login
        Stack(
          children: [
            Row(
              children: [
                // IF tamaño pantalla
                ResponsiveWidget.isSmallScreen(context)
                    ? HomePageCaruselFirst(imageSliders: imageSliders)
                    : Container(
                        padding: EdgeInsets.all(8),
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 1,
                              child: ContactoHomePage(),
                            ),
                            // Flexible(child: Spacer()),
                            Flexible(
                              flex: 2,
                              child: HomePageCaruselFirst(
                                  imageSliders: imageSliders),
                            ),
                          ],
                        ),
                      ),
              ],
            ),
            Column(
              children: [
                FloatingQuickAccessBar(screenSize: MediaQuery.of(context).size),
                Container(
                  child: Column(
                    children: [
                      ResponsiveWidget.isSmallScreen(context)
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ContactoHomePage(),
                            )
                          : SizedBox.shrink(),
                      FeaturedHeading(
                        screenSize: MediaQuery.of(context).size,
                      ),
                      FeaturedTiles(screenSize: MediaQuery.of(context).size)
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
        //
        DestinationHeading(screenSize: MediaQuery.of(context).size),
        DestinationCarousel(),
      ],
    );
  }
}

class ContactoHomePage extends StatelessWidget {
  const ContactoHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          PlatformText(
            'Servicios Legales rapidos y de alta calidad.',
            style: TextStyle(fontSize: 40),
          ),
          SizedBox(
            height: 30,
          ),
          PlatformText(
              'Servicios Legales por un equipo de profecionales que tienen como valores fundamentales la transparencia, cercanía y confianza. Cuentanos tu problema y te ayudamos de inmediato.'),
          SizedBox(
            height: 40,
          ),
          ElevatedButton(
              onPressed: () {
                showDialogContactForm(context);
              },
              child: PlatformText('Solicita tu Consulta Gratis'))
        ],
      ),
    );
  }
}

class HomePageCaruselFirst extends StatelessWidget {
  const HomePageCaruselFirst({
    super.key,
    required this.imageSliders,
  });

  final List<Widget> imageSliders;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.45,
      width: ResponsiveWidget.isSmallScreen(context)
          ? MediaQuery.of(context).size.width
          : MediaQuery.of(context).size.width - 40,
      child: Container(
          child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 5),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          pageViewKey: PageStorageKey<String>('carousel_slider'),
        ),
        items: imageSliders,
      )),
    );
  }
}
