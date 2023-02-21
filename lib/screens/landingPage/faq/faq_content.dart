import 'package:derecho_inteligente/constants/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_faq/flutter_faq.dart';

class FAQ_Content extends StatelessWidget {
  const FAQ_Content({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 5),
        FAQ(
          question: "Question",
          answer: "data",
          expandedIcon: const Icon(Icons.minimize),
          collapsedIcon: const Icon(Icons.add),
          ansStyle: const TextStyle(
              color: Constants.derechoInteligenteIndigoDye, fontSize: 15),
          queStyle: const TextStyle(
              color: Constants.derechoInteligenteAliceBlue, fontSize: 35),
          ansDecoration: BoxDecoration(
              color: Colors.grey[550],
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          queDecoration: BoxDecoration(
              color: Constants.derechoInteligenteIndigoDye,
              borderRadius: const BorderRadius.all(Radius.circular(20))),
        ),
      ],
    );
  }
}
