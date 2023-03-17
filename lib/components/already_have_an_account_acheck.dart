import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../constants/custom_colors.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function? press;
  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        PlatformText(
          login ? "Don’t have an Account ? " : "Already have an Account ? ",
          style: const TextStyle(color: Constants.kPrimaryColor),
        ),
        GestureDetector(
          onTap: press as void Function()?,
          child: PlatformText(
            login ? "Sign Up" : "Sign In",
            style: const TextStyle(
              color: Constants.kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
