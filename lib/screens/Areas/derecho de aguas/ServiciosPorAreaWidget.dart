import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/Areas/ServiciosPorAreaController.dart';
import '../../../widgets/responsive.dart';

class ServiciosPorArea extends GetView<ServiciosPorAreaController> {
  ServiciosPorArea({
    required this.image,
    required this.title,
    required this.text,
    required this.hooverNumber,
    // required this.hooverMultiplication,
    super.key,
  });

  final ServiciosPorAreaController controller =
      Get.put<ServiciosPorAreaController>(ServiciosPorAreaController());
  var image;
  var title;
  var text;
  var hooverNumber;
  // var hooverMultiplication;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (value) {
        // setState(() {
        value
            ? controller.isHovering[hooverNumber] = true
            : controller.isHovering[hooverNumber] = false;
        // print(value);
        // });
      },
      child: Container(
        padding: EdgeInsets.only(top: 20, right: 20, left: 20),
        // height: 400,
        width: ResponsiveWidget.isSmallScreen(context)
            ? MediaQuery.of(context).size.width
            : MediaQuery.of(context).size.width / 3,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                image,
                fit: BoxFit.fill,
              ),
            ),
            Obx(
              () => controller.isHovering[hooverNumber]
                  ? Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 60,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              text,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
