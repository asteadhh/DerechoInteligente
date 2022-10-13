import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/config/routes/app_pages.dart';
import '../../../constants.dart';
import '../../../controllers/register_login_controller.dart';
import '../auth_screen.dart';
import 'custom_button.dart';
import 'custom_input_field.dart';
import 'fade_slide_transition.dart';

class RegisterForm extends StatelessWidget {
  final Animation<double> animation;

  RegisterForm({
    required this.animation,
  });
  RegistroLogin sx = Get.put(RegistroLogin());
  @override
  Widget build(BuildContext context) {
    final height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    final space = height > 650 ? kSpaceM : kSpaceS;

    return GetBuilder<LoginRegisterController>(
      init: LoginRegisterController(),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: kPaddingL),
          child: Column(
            children: <Widget>[
              FadeSlideTransition(
                animation: animation,
                additionalOffset: 0.0,
                child: CustomInputField(
                  controller: null,
                  label: 'Nombre',
                  prefixIcon: Icons.person,
                  obscureText: false,
                ),
              ),
              FadeSlideTransition(
                animation: animation,
                additionalOffset: 0.0,
                child: CustomInputField(
                  controller: null,
                  label: 'Apellido',
                  prefixIcon: Icons.person,
                  obscureText: false,
                ),
              ),
              FadeSlideTransition(
                animation: animation,
                additionalOffset: 0.0,
                child: CustomInputField(
                  controller: _.emailController,
                  label: 'Username or Email',
                  prefixIcon: Icons.person,
                  obscureText: false,
                ),
              ),
              SizedBox(height: space),
              FadeSlideTransition(
                animation: animation,
                additionalOffset: space,
                child: CustomInputField(
                  controller: _.passwordController,
                  label: 'Password',
                  prefixIcon: Icons.lock,
                  obscureText: true,
                ),
              ),
              SizedBox(height: space),
              FadeSlideTransition(
                animation: animation,
                additionalOffset: 2 * space,
                child: CustomButton(
                  color: kBlue,
                  textColor: kWhite,
                  text: 'Registar Cuenta',
                  onPressed: () {
                    _.register();
                  },
                ),
              ),
              SizedBox(height: 2 * space),
              SizedBox(height: space),
              FadeSlideTransition(
                animation: animation,
                additionalOffset: 4 * space,
                child: CustomButton(
                  color: kBlack,
                  textColor: kWhite,
                  text: '¿Tienes una cuenta?',
                  onPressed: () {
                    sx.toggle();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
