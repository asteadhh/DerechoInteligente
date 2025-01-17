import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:get/get.dart';

import '../../controllers/LoginController/login_controller.dart';
import '../../screens/home_page.dart';
import 'package:flutter/material.dart';

import '../LoginButtons/facebook_sign_in_button.dart';
import '../LoginButtons/google_sign_in_button.dart';

class AuthDialog extends GetView<LoginController> {
//   @override
//   _AuthDialogState createState() => _AuthDialogState();
// }

// class _AuthDialogState extends State<AuthDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: AuthDialogContentDesktop(),
    );
  }
}

class AuthDialogContentDesktop extends StatefulWidget {
  const AuthDialogContentDesktop({super.key});

  @override
  State<AuthDialogContentDesktop> createState() =>
      _AuthDialogContentDesktopState();
}

class _AuthDialogContentDesktopState extends State<AuthDialogContentDesktop> {
  final LoginController controller =
      Get.put<LoginController>(LoginController());
  late TextEditingController textControllerEmail;
  late FocusNode textFocusNodeEmail;
  bool _isEditingEmail = false;

  late TextEditingController textControllerPassword;
  late FocusNode textFocusNodePassword;
  bool _isEditingPassword = false;

  bool _isRegistering = false;
  bool _isLoggingIn = false;

  String? loginStatus;
  Color loginStringColor = Colors.green;

  String? _validateEmail(String value) {
    value = value.trim();

    if (textControllerEmail.text.isNotEmpty) {
      if (value.isEmpty) {
        return 'Email can\'t be empty';
      } else if (!value.contains(RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
        return 'Enter a correct email address';
      }
    }

    return null;
  }

  String? _validatePassword(String value) {
    value = value.trim();

    if (textControllerEmail.text.isNotEmpty) {
      if (value.isEmpty) {
        return 'Password can\'t be empty';
      } else if (value.length < 6) {
        return 'Length of password should be greater than 6';
      }
    }

    return null;
  }

  @override
  void initState() {
    textControllerEmail = TextEditingController();
    textControllerPassword = TextEditingController();
    textControllerEmail.text = '';
    textControllerPassword.text = '';
    textFocusNodeEmail = FocusNode();
    textFocusNodePassword = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final LoginController controller =
        Get.put<LoginController>(LoginController());

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: 400,
          color: Theme.of(context).backgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: PlatformText(
                  'Derecho Inteligente',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.headline1!.color,
                    fontSize: 24,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  bottom: 8,
                ),
                child: PlatformText(
                  'Email address',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Theme.of(context).textTheme.subtitle2!.color,
                    fontSize: 18,
                    // fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    // letterSpacing: 3,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20,
                ),
                child: TextField(
                  focusNode: textFocusNodeEmail,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  controller: textControllerEmail,
                  autofocus: false,
                  onChanged: (value) {
                    setState(() {
                      _isEditingEmail = true;
                    });
                  },
                  onSubmitted: (value) {
                    textFocusNodeEmail.unfocus();
                    FocusScope.of(context).requestFocus(textFocusNodePassword);
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    border: new OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.blueGrey[800]!,
                        width: 3,
                      ),
                    ),
                    filled: true,
                    hintStyle: new TextStyle(
                      color: Colors.blueGrey[300],
                    ),
                    hintText: "Email",
                    fillColor: Colors.white,
                    errorText: _isEditingEmail
                        ? _validateEmail(textControllerEmail.text)
                        : null,
                    errorStyle: TextStyle(
                      fontSize: 12,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  bottom: 8,
                ),
                child: PlatformText(
                  'Password',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Theme.of(context).textTheme.subtitle2!.color,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    // letterSpacing: 3,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20,
                ),
                child: TextField(
                  focusNode: textFocusNodePassword,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  controller: textControllerPassword,
                  obscureText: true,
                  autofocus: false,
                  onChanged: (value) {
                    setState(() {
                      _isEditingPassword = true;
                    });
                  },
                  onSubmitted: (value) {
                    textFocusNodePassword.unfocus();
                    FocusScope.of(context).requestFocus(textFocusNodePassword);
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    border: new OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.blueGrey[800]!,
                        width: 3,
                      ),
                    ),
                    filled: true,
                    hintStyle: new TextStyle(
                      color: Colors.blueGrey[300],
                    ),
                    hintText: "Password",
                    fillColor: Colors.white,
                    errorText: _isEditingPassword
                        ? _validatePassword(textControllerPassword.text)
                        : null,
                    errorStyle: TextStyle(
                      fontSize: 12,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(color: Colors.blueGrey, width: 3),
                          ),
                          color: Colors.white,
                        ),
                        width: double.maxFinite,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.blueGrey.shade800,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          onPressed: () async {
                            setState(() {
                              _isLoggingIn = true;
                              textFocusNodeEmail.unfocus();
                              textFocusNodePassword.unfocus();
                            });
                            if (_validateEmail(textControllerEmail.text) ==
                                    null &&
                                _validatePassword(
                                        textControllerPassword.text) ==
                                    null) {
                              await controller
                                  .signInWithEmailPassword(
                                      textControllerEmail.text,
                                      textControllerPassword.text)
                                  .then((result) {
                                if (result != null) {
                                  print(result);
                                  setState(() {
                                    loginStatus =
                                        'You have successfully logged in';
                                    loginStringColor = Colors.green;
                                  });
                                  Future.delayed(Duration(milliseconds: 500),
                                      () {
                                    Navigator.of(context).pop();
                                    Navigator.of(context)
                                        .pushReplacement(MaterialPageRoute(
                                      fullscreenDialog: true,
                                      builder: (context) => Home(),
                                    ));
                                  });
                                }
                              }).catchError((error) {
                                print('Login Error: $error');
                                setState(() {
                                  loginStatus =
                                      'Error occured while logging in';
                                  loginStringColor = Colors.red;
                                });
                              });
                            } else {
                              setState(() {
                                loginStatus = 'Please enter email & password';
                                loginStringColor = Colors.red;
                              });
                            }
                            setState(() {
                              _isLoggingIn = false;
                              textControllerEmail.text = '';
                              textControllerPassword.text = '';
                              _isEditingEmail = false;
                              _isEditingPassword = false;
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 15.0,
                              bottom: 15.0,
                            ),
                            child: _isLoggingIn
                                ? SizedBox(
                                    height: 16,
                                    width: 16,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor:
                                          new AlwaysStoppedAnimation<Color>(
                                        Colors.white,
                                      ),
                                    ),
                                  )
                                : PlatformText(
                                    'Log in',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Flexible(
                      flex: 1,
                      child: Container(
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(color: Colors.blueGrey, width: 3),
                          ),
                          color: Colors.white,
                        ),
                        width: double.maxFinite,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.blueGrey.shade800,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: () async {
                            setState(() {
                              _isRegistering = true;
                            });
                            await controller
                                .registerWithEmailPassword(
                                    textControllerEmail.text,
                                    textControllerPassword.text)
                                .then((result) {
                              if (result != null) {
                                setState(() {
                                  loginStatus =
                                      'You have registered successfully';
                                  loginStringColor = Colors.green;
                                });
                                print(result);
                              }
                            }).catchError((error) {
                              print('Registration Error: $error');
                              setState(() {
                                loginStatus = 'Error occured while registering';
                                loginStringColor = Colors.red;
                              });
                            });

                            setState(() {
                              _isRegistering = false;
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 15.0,
                              bottom: 15.0,
                            ),
                            child: _isRegistering
                                ? SizedBox(
                                    height: 16,
                                    width: 16,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor:
                                          new AlwaysStoppedAnimation<Color>(
                                        Colors.white,
                                      ),
                                    ),
                                  )
                                : PlatformText(
                                    'Sign up',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              loginStatus != null
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          bottom: 20.0,
                        ),
                        child: PlatformText(
                          loginStatus!,
                          style: TextStyle(
                            color: loginStringColor,
                            fontSize: 14,
                            // letterSpacing: 3,
                          ),
                        ),
                      ),
                    )
                  : Container(),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                  right: 40.0,
                ),
                child: Container(
                  height: 1,
                  width: double.maxFinite,
                  color: Colors.blueGrey[200],
                ),
              ),
              SizedBox(height: 10),
              Center(child: GoogleButton()),
              SizedBox(height: 5),
              Center(child: FacebookButton()),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: PlatformText(
                  'By proceeding, you agree to our Terms of Use and confirm you have read our Privacy Policy.',
                  maxLines: 2,
                  style: TextStyle(
                    color: Theme.of(context).textTheme.subtitle2!.color,
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    // letterSpacing: 3,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AuthDialogContentMobile extends StatefulWidget {
  const AuthDialogContentMobile({super.key});

  @override
  State<AuthDialogContentMobile> createState() =>
      _AuthDialogContentMobileState();
}

class _AuthDialogContentMobileState extends State<AuthDialogContentMobile> {
  late TextEditingController textControllerEmail;
  late FocusNode textFocusNodeEmail;
  bool _isEditingEmail = false;

  late TextEditingController textControllerPassword;
  late FocusNode textFocusNodePassword;
  bool _isEditingPassword = false;

  bool _isRegistering = false;
  bool _isLoggingIn = false;

  String? loginStatus;
  Color loginStringColor = Colors.green;

  String? _validateEmail(String value) {
    value = value.trim();

    if (textControllerEmail.text.isNotEmpty) {
      if (value.isEmpty) {
        return 'Email can\'t be empty';
      } else if (!value.contains(RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
        return 'Enter a correct email address';
      }
    }

    return null;
  }

  String? _validatePassword(String value) {
    value = value.trim();

    if (textControllerEmail.text.isNotEmpty) {
      if (value.isEmpty) {
        return 'Password can\'t be empty';
      } else if (value.length < 6) {
        return 'Length of password should be greater than 6';
      }
    }

    return null;
  }

  @override
  void initState() {
    textControllerEmail = TextEditingController();
    textControllerPassword = TextEditingController();
    textControllerEmail.text = '';
    textControllerPassword.text = '';
    textFocusNodeEmail = FocusNode();
    textFocusNodePassword = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final LoginController controller =
        Get.put<LoginController>(LoginController());
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: 400,
              color: Theme.of(context).backgroundColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: PlatformText(
                      'Derecho Inteligente',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.headline1!.color,
                        fontSize: 24,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      bottom: 8,
                    ),
                    child: PlatformText(
                      'Email address',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Theme.of(context).textTheme.subtitle2!.color,
                        fontSize: 18,
                        // fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        // letterSpacing: 3,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20,
                    ),
                    child: TextField(
                      focusNode: textFocusNodeEmail,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      controller: textControllerEmail,
                      autofocus: false,
                      onChanged: (value) {
                        setState(() {
                          _isEditingEmail = true;
                        });
                      },
                      onSubmitted: (value) {
                        textFocusNodeEmail.unfocus();
                        FocusScope.of(context)
                            .requestFocus(textFocusNodePassword);
                      },
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.blueGrey[800]!,
                            width: 3,
                          ),
                        ),
                        filled: true,
                        hintStyle: new TextStyle(
                          color: Colors.blueGrey[300],
                        ),
                        hintText: "Email",
                        fillColor: Colors.white,
                        errorText: _isEditingEmail
                            ? _validateEmail(textControllerEmail.text)
                            : null,
                        errorStyle: TextStyle(
                          fontSize: 12,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      bottom: 8,
                    ),
                    child: PlatformText(
                      'Password',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Theme.of(context).textTheme.subtitle2!.color,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        // letterSpacing: 3,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20,
                    ),
                    child: TextField(
                      focusNode: textFocusNodePassword,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      controller: textControllerPassword,
                      obscureText: true,
                      autofocus: false,
                      onChanged: (value) {
                        setState(() {
                          _isEditingPassword = true;
                        });
                      },
                      onSubmitted: (value) {
                        textFocusNodePassword.unfocus();
                        FocusScope.of(context)
                            .requestFocus(textFocusNodePassword);
                      },
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.blueGrey[800]!,
                            width: 3,
                          ),
                        ),
                        filled: true,
                        hintStyle: new TextStyle(
                          color: Colors.blueGrey[300],
                        ),
                        hintText: "Password",
                        fillColor: Colors.white,
                        errorText: _isEditingPassword
                            ? _validatePassword(textControllerPassword.text)
                            : null,
                        errorStyle: TextStyle(
                          fontSize: 12,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: BorderSide(
                                    color: Colors.blueGrey, width: 3),
                              ),
                              color: Colors.white,
                            ),
                            width: double.maxFinite,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                primary: Colors.blueGrey.shade800,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                              onPressed: () async {
                                setState(() {
                                  _isLoggingIn = true;
                                  textFocusNodeEmail.unfocus();
                                  textFocusNodePassword.unfocus();
                                });
                                if (_validateEmail(textControllerEmail.text) ==
                                        null &&
                                    _validatePassword(
                                            textControllerPassword.text) ==
                                        null) {
                                  await controller
                                      .signInWithEmailPassword(
                                          textControllerEmail.text,
                                          textControllerPassword.text)
                                      .then((result) {
                                    if (result != null) {
                                      print(result);
                                      setState(() {
                                        loginStatus =
                                            'You have successfully logged in';
                                        loginStringColor = Colors.green;
                                      });
                                      Future.delayed(
                                          Duration(milliseconds: 500), () {
                                        Navigator.of(context).pop();
                                        Navigator.of(context)
                                            .pushReplacement(MaterialPageRoute(
                                          fullscreenDialog: true,
                                          builder: (context) => Home(),
                                        ));
                                      });
                                    }
                                  }).catchError((error) {
                                    print('Login Error: $error');
                                    setState(() {
                                      loginStatus =
                                          'Error occured while logging in';
                                      loginStringColor = Colors.red;
                                    });
                                  });
                                } else {
                                  setState(() {
                                    loginStatus =
                                        'Please enter email & password';
                                    loginStringColor = Colors.red;
                                  });
                                }
                                setState(() {
                                  _isLoggingIn = false;
                                  textControllerEmail.text = '';
                                  textControllerPassword.text = '';
                                  _isEditingEmail = false;
                                  _isEditingPassword = false;
                                });
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: 15.0,
                                  bottom: 15.0,
                                ),
                                child: _isLoggingIn
                                    ? SizedBox(
                                        height: 16,
                                        width: 16,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          valueColor:
                                              new AlwaysStoppedAnimation<Color>(
                                            Colors.white,
                                          ),
                                        ),
                                      )
                                    : PlatformText(
                                        'Log in',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.blueGrey,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Flexible(
                          flex: 1,
                          child: Container(
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: BorderSide(
                                    color: Colors.blueGrey, width: 3),
                              ),
                              color: Colors.white,
                            ),
                            width: double.maxFinite,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                primary: Colors.blueGrey.shade800,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              onPressed: () async {
                                setState(() {
                                  _isRegistering = true;
                                });
                                await controller
                                    .registerWithEmailPassword(
                                        textControllerEmail.text,
                                        textControllerPassword.text)
                                    .then((result) {
                                  if (result != null) {
                                    setState(() {
                                      loginStatus =
                                          'You have registered successfully';
                                      loginStringColor = Colors.green;
                                    });
                                    print(result);
                                  }
                                }).catchError((error) {
                                  print('Registration Error: $error');
                                  setState(() {
                                    loginStatus =
                                        'Error occured while registering';
                                    loginStringColor = Colors.red;
                                  });
                                });

                                setState(() {
                                  _isRegistering = false;
                                });
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: 15.0,
                                  bottom: 15.0,
                                ),
                                child: _isRegistering
                                    ? SizedBox(
                                        height: 16,
                                        width: 16,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          valueColor:
                                              new AlwaysStoppedAnimation<Color>(
                                            Colors.white,
                                          ),
                                        ),
                                      )
                                    : PlatformText(
                                        'Sign up',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.blueGrey,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  loginStatus != null
                      ? Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              bottom: 20.0,
                            ),
                            child: PlatformText(
                              loginStatus!,
                              style: TextStyle(
                                color: loginStringColor,
                                fontSize: 14,
                                // letterSpacing: 3,
                              ),
                            ),
                          ),
                        )
                      : Container(),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 40.0,
                      right: 40.0,
                    ),
                    child: Container(
                      height: 1,
                      width: double.maxFinite,
                      color: Colors.blueGrey[200],
                    ),
                  ),
                  SizedBox(height: 10),
                  Center(child: GoogleButton()),
                  SizedBox(height: 5),
                  Center(child: FacebookButton()),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PlatformText(
                      'By proceeding, you agree to our Terms of Use and confirm you have read our Privacy Policy.',
                      maxLines: 2,
                      style: TextStyle(
                        color: Theme.of(context).textTheme.subtitle2!.color,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        // letterSpacing: 3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
