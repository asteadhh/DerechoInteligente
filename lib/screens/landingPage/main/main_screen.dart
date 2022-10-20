import 'package:flutter/material.dart';

import '../../../widgets/bottom_bar.dart';
import '../../../widgets/carousel.dart';
import '../../../widgets/destination_heading.dart';
import '../../../widgets/featured_heading.dart';
import '../../../widgets/featured_tiles.dart';
import '../../../widgets/floating_quick_access_bar.dart';

class HomeLanding extends StatelessWidget {
  HomeLanding({
    Key? key,
    // required this.screenSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Stack(
          children: [
            Container(
              child: SizedBox(
                height: screenSize.height * 0.45,
                width: screenSize.width,
                child: Image.asset(
                  'assets/images/cover.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              children: [
                FloatingQuickAccessBar(screenSize: screenSize),
                Container(
                  child: Column(
                    children: [
                      FeaturedHeading(
                        screenSize: screenSize,
                      ),
                      FeaturedTiles(screenSize: screenSize)
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
        DestinationHeading(screenSize: screenSize),
        DestinationCarousel(),
        SizedBox(height: screenSize.height / 10),
        BottomBar(),
      ],
    );
  }
}
