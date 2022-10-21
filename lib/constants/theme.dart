import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

// import 'custom_colors.dart';
import '../constants/custom_colors.dart';

ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.blueGrey,
  backgroundColor: Colors.blueGrey[900],
  accentColor: Constants.bgColor,
  cardColor: Colors.black,
  primaryTextTheme: TextTheme(
    button: TextStyle(
      color: Colors.blueGrey[200],
      decorationColor: Colors.blueGrey[50],
    ),
    subtitle2: TextStyle(
      color: Colors.white,
    ),
    subtitle1: TextStyle(
      color: Colors.blueGrey[300],
    ),
    headline1: TextStyle(
      color: Colors.white70,
    ),
  ),
  bottomAppBarColor: Colors.black,
  iconTheme: IconThemeData(color: Colors.blueGrey[200]),
  brightness: Brightness.dark,
);

ThemeData lightTheme = ThemeData(
  accentColor: Constants.bgColor,
  primarySwatch: Colors.blueGrey,
  backgroundColor: Colors.white,
  cardColor: Colors.blueGrey[50],
  primaryTextTheme: TextTheme(
    button: TextStyle(
      color: Colors.blueGrey,
      decorationColor: Colors.blueGrey[300],
    ),
    subtitle2: TextStyle(
      color: Colors.blueGrey[900],
    ),
    subtitle1: TextStyle(
      color: Colors.black,
    ),
    headline1: TextStyle(color: Colors.blueGrey[800]),
  ),
  bottomAppBarColor: Colors.blueGrey[900],
  iconTheme: IconThemeData(color: Colors.blueGrey),
  brightness: Brightness.light,
);

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
