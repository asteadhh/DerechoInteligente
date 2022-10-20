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
  const HomeLandingContent({
    Key? key,
    // required this.screenSize,
  }) : super(key: key);

  // final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
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
            Column(
              children: [
                FloatingQuickAccessBar(screenSize: MediaQuery.of(context).size),
                Container(
                  child: Column(
                    children: [
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
        DestinationHeading(screenSize: MediaQuery.of(context).size),
        DestinationCarousel(),
      ],
    );
  }
}
