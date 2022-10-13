import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import '../../../controllers/login_controller.dart';
import '../auth_screen.dart';
import '../../../constants.dart';
import 'custom_button.dart';
import 'custom_input_field.dart';
import 'fade_slide_transition.dart';

class LoginForm extends StatelessWidget {
  // final onClickedSignUp;
  final Animation<double> animation;

  LoginForm({
    required this.animation,
  });
  // final LoginRegisterBool registroOLogin = Get.put(LoginRegisterBool());
  RegistroLogin sx = Get.put(RegistroLogin());
  OlvidoContrasena recuperar = Get.put(OlvidoContrasena());
  @override
  Widget build(BuildContext context) {
    final height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    final space = height > 650 ? kSpaceM : kSpaceS;
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: kPaddingL),
          child: Column(
            children: <Widget>[
              FadeSlideTransition(
                animation: animation,
                additionalOffset: 0.0,
                // child: PlatformText('data'),
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
                  text: 'Inicia Sesión',
                  onPressed: () async {
                    _.signInWithEmailAndPassword();
                    // Get.rootDelegate.toNamed(AppPages.initial);
                  },
                ),
              ),
              SizedBox(height: 1 * space),
              FadeSlideTransition(
                animation: animation,
                additionalOffset: 3 * space,
                child: Expanded(
                  child: SignInButton(
                    Buttons.Google,
                    text: "Continua con Google",
                    onPressed: () async {
                      _.signInWithGoogle();
                      // Get.offAndToNamed(AppPages.dashboard);
                      // AuthController().googleSignInAccount;
                    },
                  ),
                ),
              ),
              SizedBox(height: 1 * space),
              FadeSlideTransition(
                animation: animation,
                additionalOffset: 3 * space,
                child: Expanded(
                  child: SignInButton(
                    Buttons.Facebook,
                    text: "Continua con Facebook",
                    onPressed: () async {
                      _.signInWithGoogle();
                      // Get.offAndToNamed(AppPages.dashboard);
                      // AuthController().googleSignInAccount;
                    },
                  ),
                ),
              ),
              SizedBox(height: 1 * space),
              FadeSlideTransition(
                animation: animation,
                additionalOffset: 3 * space,
                child: Expanded(
                  child: SignInButton(
                    Buttons.Apple,
                    text: "Continua con Apple",
                    onPressed: () async {
                      _.signInWithGoogle();
                      // Get.offAndToNamed(AppPages.dashboard);
                      // AuthController().googleSignInAccount;
                    },
                  ),
                ),
              ),
              SizedBox(height: space),
              FadeSlideTransition(
                animation: animation,
                additionalOffset: 4 * space,
                child: CustomButton(
                  color: kDarkBlue,
                  textColor: kWhite,
                  text: 'Recupera tu contraseña',
                  onPressed: () {
                    recuperar.toggle();
                  },
                ),
              ),
              SizedBox(height: space),
              FadeSlideTransition(
                animation: animation,
                additionalOffset: 4 * space,
                child: CustomButton(
                  color: kBlack,
                  textColor: kWhite,
                  text: 'Crear una cuenta Jurix',
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
