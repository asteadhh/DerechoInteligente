import 'package:flutter/material.dart';

import '../../../../constants/custom_colors copy.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble({
    Key? key,
    required this.message,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: CustomColors.jurixNavy,
            borderRadius: BorderRadius.circular(12),
          ),
          width: width * .5,
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16,
          ),
          margin: EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 8,
          ),
          child: Text(
            message,
            style: TextStyle(
              color: CustomColors.jurixNaranjo,
            ),
          ),
        ),
      ],
    );
  }
}
