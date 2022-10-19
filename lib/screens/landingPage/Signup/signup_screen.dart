import 'package:flutter/material.dart';
import '../../../constants/custom_colors.dart';
import '../../../responsive.dart';
import 'components/sign_up_top_image.dart';
import 'components/signup_form.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: MobileSignupScreen(),
      // mobile: Container(),
      desktop: DesktopSignupScreen(),
      // desktop: Container(),
    );
  }
}

class DesktopSignupScreen extends StatelessWidget {
  DesktopSignupScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SignUpScreenTopImage(),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 450,
                child: SignUpForm(),
              ),
              SizedBox(height: Constants.defaultPadding / 2),
              // SocalSignUp()
            ],
          ),
        )
      ],
    );
  }
}

class MobileSignupScreen extends StatelessWidget {
  MobileSignupScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SignUpScreenTopImage(),
        Row(
          children: [
            Spacer(),
            Expanded(
              flex: 8,
              child: SignUpForm(),
            ),
            Spacer(),
          ],
        ),
        // const SocalSignUp()
      ],
    );
  }
}
