import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:get/get.dart';
import '/widgets/responsive.dart';
import 'package:flutter/material.dart';

class DestinationCarousel extends StatefulWidget {
  @override
  _DestinationCarouselState createState() => _DestinationCarouselState();
}

class _DestinationCarouselState extends State<DestinationCarousel> {
  final String imagePath = 'assets/images/';

  final CarouselController _controller = CarouselController();

  List _isHovering = [false, false, false, false, false, false, false];
  List _isSelected = [true, false, false, false, false, false, false];

  int _current = 0;

  final List<String> images = [
    'assets/images/asia.jpg',
    'assets/images/africa.jpg',
    'assets/images/europe.jpg',
    'assets/images/south_america.jpg',
    'assets/images/australia.jpg',
    'assets/images/antarctica.jpg',
  ];

  final List<String> places = [
    'bankruptcyLaw'.tr,
    'corporateLaw'.tr,
    'taxLaw'.tr,
    'criminalLaw'.tr,
    'publicLaw'.tr,
    'constitutionalLaw'.tr,
    'familyLaw'.tr,
    'civilLaw'.tr,
    'laborLaw'.tr,
    'jplLaw'.tr,
    'willLaw'.tr,
    'consumerLaw'.tr,
    'environmentalLaw'.tr,
    'extractionLaw'.tr,
    'waterRights'.tr,
    'healthLaw'.tr,
    'developmentLaw'.tr,
    'freeCompetitionAndConsumption'.tr,
  ];

  List<Widget> generateImageTiles(screenSize) {
    return images
        .map(
          (element) => ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              element,
              fit: BoxFit.cover,
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var imageSliders = generateImageTiles(screenSize);

    return Stack(
      children: [
        CarouselSlider(
          items: imageSliders,
          options: CarouselOptions(
              scrollPhysics: ResponsiveWidget.isSmallScreen(context)
                  ? PageScrollPhysics()
                  // : NeverScrollableScrollPhysics(),
                  : PageScrollPhysics(),
              enlargeCenterPage: true,
              aspectRatio: 18 / 8,
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                  for (int i = 0; i < imageSliders.length; i++) {
                    if (i == index) {
                      _isSelected[i] = true;
                    } else {
                      _isSelected[i] = false;
                    }
                  }
                });
              }),
          carouselController: _controller,
        ),
        // PlatformText('data'),

        AspectRatio(
          aspectRatio: 18 / 8,
          child: Center(
            child: PlatformText(
              places[_current],
              style: TextStyle(
                letterSpacing: 8,
                fontFamily: 'Electrolize',
                fontSize: screenSize.width / 25,
                color: Colors.white,
              ),
            ),
          ),
        ),

        // ResponsiveWidget.isSmallScreen(context)
        //     ? SizedBox.shrink()
        //     : AspectRatio(
        //         aspectRatio: 17 / 8,
        //         child: Center(
        //           heightFactor: 1,
        //           // child: SizedBox.shrink(),
        //           child: Align(
        //             alignment: Alignment.bottomCenter,
        //             // child: Padding(
        //             //   padding: EdgeInsets.only(
        //             //     left: screenSize.width / 8,
        //             //     right: screenSize.width / 8,
        //             //   ),
        //             child: Card(
        //               elevation: 5,
        //               child: Padding(
        //                 padding: EdgeInsets.only(
        //                   top: screenSize.height / 50,
        //                   bottom: screenSize.height / 50,
        //                 ),
        //                 child: Row(
        //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //                   children: [
        //                     for (int i = 0; i < places.length; i++)
        //                       Column(
        //                         mainAxisSize: MainAxisSize.min,
        //                         children: [
        //                           InkWell(
        //                             splashColor: Colors.transparent,
        //                             hoverColor: Colors.transparent,
        //                             onHover: (value) {
        //                               setState(() {
        //                                 value
        //                                     ? _isHovering[i] = true
        //                                     : _isHovering[i] = false;
        //                               });
        //                             },
        //                             onTap: () {
        //                               _controller.animateToPage(i);
        //                             },
        //                             child: Padding(
        //                               padding: EdgeInsets.only(
        //                                   top: screenSize.height / 80,
        //                                   bottom: screenSize.height / 90),
        //                               child: PlatformText(
        //                                 places[i],
        //                                 style: TextStyle(
        //                                   color: _isHovering[i]
        //                                       ? Theme.of(context)
        //                                           .primaryTextTheme
        //                                           .button!
        //                                           .decorationColor
        //                                       : Theme.of(context)
        //                                           .primaryTextTheme
        //                                           .button!
        //                                           .color,
        //                                 ),
        //                               ),
        //                             ),
        //                           ),
        //                           Visibility(
        //                             maintainSize: true,
        //                             maintainAnimation: true,
        //                             maintainState: true,
        //                             visible: _isSelected[i],
        //                             child: AnimatedOpacity(
        //                               duration: Duration(milliseconds: 400),
        //                               opacity: _isSelected[i] ? 1 : 0,
        //                               child: Container(
        //                                 height: 5,
        //                                 decoration: BoxDecoration(
        //                                   color: Colors.blueGrey,
        //                                   borderRadius: BorderRadius.all(
        //                                     Radius.circular(10),
        //                                   ),
        //                                 ),
        //                                 width: screenSize.width / 10,
        //                               ),
        //                             ),
        //                           )
        //                         ],
        //                       ),
        //                   ],
        //                 ),
        //                 // ),
        //               ),
        //             ),
        //           ),
        //         ),
        //       ),
      ],
    );
  }
}
