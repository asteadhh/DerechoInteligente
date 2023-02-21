import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/TextoHovering/texto_hovering_controller.dart';

class BottomBarColumn extends GetView<TextoHoveringController> {
  var heading;
  final String s1;
  String? s1Link;
  final String s2;
  String? s2Link;
  final String s3;
  String? s3Link;
  var s1Page;
  var s2Page;
  var s3Page;
  var headingPage;
  var hoveringNumber;

  BottomBarColumn({
    required this.heading,
    required this.s1,
    required this.s2,
    required this.s3,
    this.s1Link,
    this.s2Link,
    this.s3Link,
    this.s1Page,
    this.s2Page,
    this.s3Page,
    this.headingPage,
    required this.hoveringNumber,
  });

  _launchURL(url) async {
    // const url = 'https://flutter.io';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  final TextoHoveringController controller =
      Get.put<TextoHoveringController>(TextoHoveringController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //
          InkWell(
            onHover: (value) {
              // setState(() {
              value
                  ? controller.isHovering[(hoveringNumber * 10) + 0] = true
                  : controller.isHovering[(hoveringNumber * 10) + 0] = false;
              // });
            },
            onTap: () {
              headingPage;
            },
            child: Obx(
              () => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    heading,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: controller.isHovering[(hoveringNumber * 10) + 0]
                          ? Colors.blue[200]
                          : Colors.blueGrey[300],
                    ),
                  ),
                  SizedBox(height: 5),
                  Visibility(
                    maintainAnimation: true,
                    maintainState: true,
                    maintainSize: true,
                    visible: controller.isHovering[(hoveringNumber * 10) + 0],
                    child: Container(
                      height: 2,
                      width: 20,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),

          SizedBox(
            height: 10,
          ),

          STextWidget(
            controller: controller,
            hoveringNumber: hoveringNumber,
            headingPage: headingPage,
            s1: s1,
          ),
          s1Page != null
              ? GestureDetector(
                  child: Text(
                    s1,
                    style: TextStyle(
                      color: Colors.blueGrey[100],
                      fontSize: 14,
                    ),
                  ),
                  onTap: s1Page,
                )
              : s1Link != null
                  ? GestureDetector(
                      child: Text(
                        s1,
                        style: TextStyle(
                          color: Colors.blueGrey[100],
                          fontSize: 14,
                        ),
                      ),
                      onTap: () {
                        _launchURL(s1Link);
                      },
                    )
                  : Text(
                      s1,
                      style: TextStyle(
                        color: Colors.blueGrey[100],
                        fontSize: 14,
                      ),
                    ),
          SizedBox(height: 5),
          s2Page != null
              ? GestureDetector(
                  child: Text(
                    s2,
                    style: TextStyle(
                      color: Colors.blueGrey[100],
                      fontSize: 14,
                    ),
                  ),
                  onTap: s2Page,
                )
              : s2Link != null
                  ? GestureDetector(
                      onTap: () {
                        _launchURL(s2Link);
                      },
                      child: Text(
                        s2,
                        style: TextStyle(
                          color: Colors.blueGrey[100],
                          fontSize: 14,
                        ),
                      ),
                    )
                  : Text(
                      s2,
                      style: TextStyle(
                        color: Colors.blueGrey[100],
                        fontSize: 14,
                      ),
                    ),
          SizedBox(height: 5),
          s3Page != null
              ? GestureDetector(
                  child: Text(
                    s3,
                    style: TextStyle(
                      color: Colors.blueGrey[100],
                      fontSize: 14,
                    ),
                  ),
                  onTap: s3Page,
                )
              : s3Link != null
                  ? GestureDetector(
                      onTap: () {
                        _launchURL(s3Link);
                      },
                      child: Text(
                        s3,
                        style: TextStyle(
                          color: Colors.blueGrey[100],
                          fontSize: 14,
                        ),
                      ),
                    )
                  : Text(
                      s3,
                      style: TextStyle(
                        color: Colors.blueGrey[100],
                        fontSize: 14,
                      ),
                    ),
        ],
      ),
    );
  }
}

class STextWidget extends StatelessWidget {
  STextWidget({
    super.key,
    required this.controller,
    required this.hoveringNumber,
    required this.headingPage,
    required this.s1,
  });

  final TextoHoveringController controller;
  var hoveringNumber;
  var headingPage;
  final String s1;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) {
        // setState(() {
        value
            ? controller.isHovering[(hoveringNumber * 10) + 1] = true
            : controller.isHovering[(hoveringNumber * 10) + 1] = false;
        // });
      },
      onTap: () {
        headingPage;
      },
      child: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              s1,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: controller.isHovering[(hoveringNumber * 10) + 1]
                    ? Colors.blue[200]
                    : Colors.blueGrey[100],
              ),
            ),
            Visibility(
              maintainAnimation: true,
              maintainState: true,
              maintainSize: true,
              visible: controller.isHovering[(hoveringNumber * 10) + 1],
              child: Column(
                children: [
                  SizedBox(height: 5),
                  Container(
                    height: 2,
                    width: 20,
                    color: Colors.white,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class s_Texts extends GetView<TextoHoveringController> {
  s_Texts({
    super.key,
    required this.hoveringNumber,
    required this.s1Text,
    required this.numbers,
  });

  var hoveringNumber;
  final String s1Text;
  var numbers;

  final TextoHoveringController controller =
      Get.put<TextoHoveringController>(TextoHoveringController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) {
        value
            ? controller.isHovering[(hoveringNumber * 10) + numbers] = true
            : controller.isHovering[(hoveringNumber * 10) + numbers] = false;
        print(controller.isHovering);
      },
      child: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              s1Text,
              style: TextStyle(
                fontSize: 14,
                color: controller.isHovering[(hoveringNumber * 10) + numbers]
                    ? Colors.blue[200]
                    : Colors.blueGrey[100],
              ),
            ),
            SizedBox(height: 5),
            Visibility(
              maintainAnimation: true,
              maintainState: true,
              maintainSize: true,
              visible: controller.isHovering[(hoveringNumber * 10) + numbers],
              // visible: true,
              child: Container(
                height: 2,
                width: 20,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
