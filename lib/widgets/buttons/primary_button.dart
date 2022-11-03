import 'package:flutter/material.dart';

import '../../constants/custom_colors copy.dart';

// import '../constants.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.text,
    required this.press,
    this.color = CustomColors.jurixNavy,
    // this.padding = 8,
  }) : super(key: key);

  final String text;
  final VoidCallback press;
  final color;
  // final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      padding: EdgeInsets.all(CustomColors.kDefaultPadding),
      color: color,
      minWidth: double.infinity,
      onPressed: press,
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
