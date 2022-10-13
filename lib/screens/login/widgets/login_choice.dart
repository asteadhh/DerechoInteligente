import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../auth_screen.dart';
import 'login_form.dart';
import 'password_recovery_form.dart';
import 'register_form.dart';

class LoginChoice extends StatelessWidget {
  const LoginChoice({
    Key? key,
    required this.sx,
    required this.recuperarContrasena,
    required Animation<double> formElementAnimation,
  })  : _formElementAnimation = formElementAnimation,
        super(key: key);

  final RegistroLogin sx;
  final OlvidoContrasena recuperarContrasena;
  final Animation<double> _formElementAnimation;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (sx.loginORegistro == true) {
          if (recuperarContrasena.olvidoContrasena == false) {
            return PasswordRecovery(animation: _formElementAnimation);
          } else {
            return LoginForm(animation: _formElementAnimation);
          }
        } else {
          return RegisterForm(animation: _formElementAnimation);
        }
      },
    );
  }
}
