import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'custom_colors.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.amber,
  // scaffoldBackgroundColor: CustomColors.backgrueriaoundcolor,
  appBarTheme: AppBarTheme(
    backgroundColor: Color.fromARGB(0, 44, 44, 44),
  ),
  fontFamily: 'OpenSans',
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.amber,
    disabledColor: Colors.grey,
  ),
  accentColor: Colors.red,
  // colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.red),
);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.amber,
  fontFamily: 'OpenSans',
  scaffoldBackgroundColor: Constants.backgroundcolor,
  appBarTheme: AppBarTheme(
    backgroundColor: Constants.backgroundcolor,
  ),
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.amber,
  ).copyWith(
    secondary: Color.fromRGBO(243, 66, 19, 1),
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(),
    bodyText2: TextStyle(),
  ).apply(
    bodyColor: Constants.ourBlack,
    displayColor: Constants.ourBlack,
  ),
);

// class Themes {
//   static final light = ThemeData.light().copyWith(
//     brightness: Brightness.light,
//     primaryColor: Colors.amber,
//     // fontFamily: 'OpenSans',
//     scaffoldBackgroundColor: CustomColors.backgroundcolor,
//     appBarTheme: AppBarTheme(
//       backgroundColor: CustomColors.backgroundcolor,
//     ),
//     colorScheme: ColorScheme.fromSwatch(
//       primarySwatch: Colors.amber,
//     ).copyWith(
//       secondary: Color.fromRGBO(243, 66, 19, 1),
//     ),
//     textTheme: TextTheme(
//       bodyText1: TextStyle(),
//       bodyText2: TextStyle(),
//     ).apply(
//       bodyColor: CustomColors.ourBlack,
//       displayColor: CustomColors.ourBlack,
//     ),
//   );
//   static final dark = ThemeData.dark().copyWith(
//       accentColor: Colors.red,
//       brightness: Brightness.dark,
//       primaryColor: Colors.amber,
//       buttonTheme: ButtonThemeData(
//         buttonColor: Colors.amber,
//         disabledColor: Colors.grey,
//       ));
// }

class ThemeService extends GetxController {
  final _box = GetStorage();
  final _key = 'isDarkMode';

  /// Get isDarkMode info from local storage and return ThemeMode
  ThemeMode get theme => loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  /// Load isDArkMode from local storage and if it's empty, returns false (that means default theme is light)
  bool loadThemeFromBox() => _box.read(_key) ?? false;

  /// Save isDarkMode to local storage
  saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);

  /// Switch theme and save to local storage
  void switchTheme() {
    Get.changeThemeMode(loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    saveThemeToBox(!loadThemeFromBox());
  }
}
