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
            separator: Container(
              height: 5,
              width: double.infinity,
              color: Colors.purple,
            ),
            question: "Question",
            answer: "data",
            expandedIcon: const Icon(Icons.minimize),
            collapsedIcon: const Icon(Icons.add),
            ansStyle: const TextStyle(color: Colors.blue, fontSize: 15),
            queStyle: const TextStyle(color: Colors.green, fontSize: 35),
            ansDecoration: BoxDecoration(
                color: Colors.grey[550],
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            queDecoration: BoxDecoration(
                color: Colors.grey[500],
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            ansPadding: const EdgeInsets.all(50)),
        FAQ(
          question: "Question",
          answer: "data",
          expandedIcon: const Icon(Icons.minimize),
          collapsedIcon: const Icon(Icons.add),
          ansStyle: const TextStyle(color: Colors.blue, fontSize: 15),
          queStyle: const TextStyle(color: Colors.green, fontSize: 35),
          ansDecoration: BoxDecoration(
              color: Colors.grey[550],
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          queDecoration: BoxDecoration(
              color: Colors.grey[500],
              borderRadius: const BorderRadius.all(Radius.circular(20))),
        ),
      ],
    );
  }
}
