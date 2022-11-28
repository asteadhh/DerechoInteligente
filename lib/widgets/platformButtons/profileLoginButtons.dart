import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/constants/firestore_constants.dart';
import '/controllers/LoginController/login_controller.dart';
import '/routes/app_pages.dart';

import '../../constants.dart';
import '../../constants/theme.dart';
import '../userInformation/User_Information.dart';

class ProfileLoginButton extends StatelessWidget {
  final String? hint;
  final String? value;
  final List<String>? dropdownItems;
  final ValueChanged<String?>? onChanged;
  final DropdownButtonBuilder? selectedItemBuilder;
  final Alignment? hintAlignment;
  final Alignment? valueAlignment;
  final double? buttonHeight, buttonWidth;
  final EdgeInsetsGeometry? buttonPadding;
  final BoxDecoration? buttonDecoration;
  final int? buttonElevation;
  final Widget? icon;
  final double? iconSize;
  final Color? iconEnabledColor;
  final Color? iconDisabledColor;
  final double? itemHeight;
  final EdgeInsetsGeometry? itemPadding;
  final double? dropdownHeight, dropdownWidth;
  final EdgeInsetsGeometry? dropdownPadding;
  final BoxDecoration? dropdownDecoration;
  final int? dropdownElevation;
  final Radius? scrollbarRadius;
  final double? scrollbarThickness;
  final bool? scrollbarAlwaysShow;
  final Offset? offset;

  const ProfileLoginButton({
    this.hint,
    this.value,
    this.dropdownItems,
    this.onChanged,
    this.selectedItemBuilder,
    this.hintAlignment,
    this.valueAlignment,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonPadding,
    this.buttonDecoration,
    this.buttonElevation,
    this.icon,
    this.iconSize,
    this.iconEnabledColor,
    this.iconDisabledColor,
    this.itemHeight,
    this.itemPadding,
    this.dropdownHeight,
    this.dropdownWidth,
    this.dropdownPadding,
    this.dropdownDecoration,
    this.dropdownElevation,
    this.scrollbarRadius,
    this.scrollbarThickness,
    this.scrollbarAlwaysShow,
    this.offset,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put<LoginController>(LoginController());
    return DropdownButtonHideUnderline(
      child: DropdownButtonHideUnderline(
        child: kIsWeb
            ? DropdownButton2(
                customButton: Container(
                  margin: EdgeInsets.only(left: defaultPadding),
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultPadding,
                    vertical: defaultPadding / 2,
                  ),
                  decoration: BoxDecoration(
                    // color: secondaryColor,
                    color: Theme.of(context).buttonColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.white10),
                  ),
                  child: Row(
                    children: [
                      UserInformationDataAvatar(),
                      SizedBox(
                        width: 10,
                      ),
                      UserInformationDataText(
                        data: FirestoreConstants.nickname,
                      ),
                    ],
                  ),
                ),
                customItemsHeights: [
                  ...List<double>.filled(
                      MenuItems.firstItemsDesktop.length, 48),
                  8,
                  ...List<double>.filled(MenuItems.secondItems.length, 48),
                ],
                items: [
                  ...MenuItems.firstItemsDesktop.map(
                    (item) => DropdownMenuItem<MenuItem>(
                      value: item,
                      child: MenuItems.buildItem(context, item),
                    ),
                  ),
                  const DropdownMenuItem<Divider>(
                      enabled: false, child: Divider()),
                  ...MenuItems.secondItems.map(
                    (item) => DropdownMenuItem<MenuItem>(
                      value: item,
                      child: MenuItems.buildItem(context, item),
                    ),
                  ),
                ],
                onChanged: (value) {
                  MenuItems.onChanged(context, value as MenuItem);
                },
                itemHeight: 48,
                itemPadding: const EdgeInsets.only(left: 16, right: 16),
                dropdownWidth: 160,
                dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Theme.of(context).buttonColor,
                ),
                dropdownElevation: 8,
                offset: const Offset(0, 8),
              )
            : DropdownButton2(
                customButton: Container(
                  margin: EdgeInsets.only(left: defaultPadding),
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultPadding,
                    vertical: defaultPadding / 2,
                  ),
                  decoration: BoxDecoration(
                    // color: secondaryColor,
                    color: Theme.of(context).buttonColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.white10),
                  ),
                  child: Row(
                    children: [
                      UserInformationDataAvatar(),
                      SizedBox(
                        width: 10,
                      ),
                      UserInformationDataText(
                        data: FirestoreConstants.nickname,
                      ),
                    ],
                  ),
                ),
                customItemsHeights: [
                  ...List<double>.filled(MenuItems.firstItemsMobile.length, 48),
                  8,
                  ...List<double>.filled(MenuItems.secondItems.length, 48),
                ],
                items: [
                  ...MenuItems.firstItemsMobile.map(
                    (item) => DropdownMenuItem<MenuItem>(
                      value: item,
                      child: MenuItems.buildItem(context, item),
                    ),
                  ),
                  const DropdownMenuItem<Divider>(
                      enabled: false, child: Divider()),
                  ...MenuItems.secondItems.map(
                    (item) => DropdownMenuItem<MenuItem>(
                      value: item,
                      child: MenuItems.buildItem(context, item),
                    ),
                  ),
                ],
                onChanged: (value) {
                  MenuItems.onChanged(context, value as MenuItem);
                },
                itemHeight: 48,
                itemPadding: const EdgeInsets.only(left: 16, right: 16),
                dropdownWidth: 160,
                dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Theme.of(context).buttonColor,
                ),
                dropdownElevation: 8,
                offset: const Offset(0, 8),
              ),
      ),
    );
  }
}

class ProfileFotoSignOutButton extends StatelessWidget {
  final String? hint;
  final String? value;
  final List<String>? dropdownItems;
  final ValueChanged<String?>? onChanged;
  final DropdownButtonBuilder? selectedItemBuilder;
  final Alignment? hintAlignment;
  final Alignment? valueAlignment;
  final double? buttonHeight, buttonWidth;
  final EdgeInsetsGeometry? buttonPadding;
  final BoxDecoration? buttonDecoration;
  final int? buttonElevation;
  final Widget? icon;
  final double? iconSize;
  final Color? iconEnabledColor;
  final Color? iconDisabledColor;
  final double? itemHeight;
  final EdgeInsetsGeometry? itemPadding;
  final double? dropdownHeight, dropdownWidth;
  final EdgeInsetsGeometry? dropdownPadding;
  final BoxDecoration? dropdownDecoration;
  final int? dropdownElevation;
  final Radius? scrollbarRadius;
  final double? scrollbarThickness;
  final bool? scrollbarAlwaysShow;
  final Offset? offset;

  const ProfileFotoSignOutButton({
    this.hint,
    this.value,
    this.dropdownItems,
    this.onChanged,
    this.selectedItemBuilder,
    this.hintAlignment,
    this.valueAlignment,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonPadding,
    this.buttonDecoration,
    this.buttonElevation,
    this.icon,
    this.iconSize,
    this.iconEnabledColor,
    this.iconDisabledColor,
    this.itemHeight,
    this.itemPadding,
    this.dropdownHeight,
    this.dropdownWidth,
    this.dropdownPadding,
    this.dropdownDecoration,
    this.dropdownElevation,
    this.scrollbarRadius,
    this.scrollbarThickness,
    this.scrollbarAlwaysShow,
    this.offset,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put<LoginController>(LoginController());
    return DropdownButtonHideUnderline(
      child: DropdownButtonHideUnderline(
        child: kIsWeb
            ? DropdownButton2(
                customButton: Container(
                  margin: EdgeInsets.only(left: defaultPadding),
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultPadding,
                    vertical: defaultPadding / 2,
                  ),
                  decoration: BoxDecoration(
                    // color: secondaryColor,
                    color: Theme.of(context).buttonColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.white10),
                  ),
                  child: Row(
                    children: [
                      UserInformationDataAvatar(),
                      SizedBox(
                        width: 10,
                      ),
                      UserInformationDataText(
                        data: FirestoreConstants.nickname,
                      ),
                    ],
                  ),
                ),
                customItemsHeights: [
                  ...List<double>.filled(
                      MenuItems.firstItemsDesktop.length, 48),
                  8,
                  ...List<double>.filled(MenuItems.secondItems.length, 48),
                ],
                items: [
                  ...MenuItems.firstItemsDesktop.map(
                    (item) => DropdownMenuItem<MenuItem>(
                      value: item,
                      child: MenuItems.buildItem(context, item),
                    ),
                  ),
                  const DropdownMenuItem<Divider>(
                      enabled: false, child: Divider()),
                  ...MenuItems.secondItems.map(
                    (item) => DropdownMenuItem<MenuItem>(
                      value: item,
                      child: MenuItems.buildItem(context, item),
                    ),
                  ),
                ],
                onChanged: (value) {
                  MenuItems.onChanged(context, value as MenuItem);
                },
                itemHeight: 48,
                itemPadding: const EdgeInsets.only(left: 16, right: 16),
                dropdownWidth: 160,
                dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Theme.of(context).buttonColor,
                ),
                dropdownElevation: 8,
                offset: const Offset(0, 8),
              )
            : DropdownButton2(
                customButton: Container(
                  margin: EdgeInsets.only(left: defaultPadding),
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultPadding,
                    vertical: defaultPadding / 2,
                  ),
                  decoration: BoxDecoration(
                    // color: secondaryColor,
                    color: Theme.of(context).buttonColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.white10),
                  ),
                  child: Row(
                    children: [
                      UserInformationDataAvatar(),
                    ],
                  ),
                ),
                customItemsHeights: [
                  ...List<double>.filled(MenuItems.firstItemsMobile.length, 48),
                  8,
                  ...List<double>.filled(MenuItems.secondItems.length, 48),
                ],
                items: [
                  ...MenuItems.firstItemsMobile.map(
                    (item) => DropdownMenuItem<MenuItem>(
                      value: item,
                      child: MenuItems.buildItem(context, item),
                    ),
                  ),
                  const DropdownMenuItem<Divider>(
                      enabled: false, child: Divider()),
                  ...MenuItems.secondItems.map(
                    (item) => DropdownMenuItem<MenuItem>(
                      value: item,
                      child: MenuItems.buildItem(context, item),
                    ),
                  ),
                ],
                onChanged: (value) {
                  MenuItems.onChanged(context, value as MenuItem);
                },
                itemHeight: 48,
                itemPadding: const EdgeInsets.only(left: 16, right: 16),
                dropdownWidth: 160,
                dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Theme.of(context).buttonColor,
                ),
                dropdownElevation: 8,
                offset: const Offset(0, 8),
              ),
      ),
    );
  }
}

class MenuItem {
  final String text;
  final IconData icon;

  const MenuItem({
    required this.text,
    required this.icon,
  });
}

class MenuItems {
  static const List<MenuItem> firstItemsDesktop = [home, darkMode, settings];
  static const List<MenuItem> firstItemsMobile = [darkMode, settings];
  static const List<MenuItem> secondItems = [logout];

  static const home = MenuItem(text: 'Home', icon: Icons.home);

  static const darkMode = MenuItem(text: 'Dark Mode', icon: Icons.dark_mode);
  static const settings = MenuItem(text: 'Settings', icon: Icons.settings);
  static const logout = MenuItem(text: 'Log Out', icon: Icons.logout);

  static Widget buildItem(BuildContext context, MenuItem item) {
    return Row(
      children: [
        Icon(item.icon,
            color: Theme.of(context).primaryTextTheme.subtitle1!.color,
            size: 22),
        const SizedBox(
          width: 10,
        ),
        Text(
          item.text,
          style: TextStyle(
            color: Theme.of(context).primaryTextTheme.subtitle1!.color,
          ),
        ),
      ],
    );
  }

  static onChanged(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.home:
        Get.offNamed(AppPages.main);
        //Do something
        break;
      case MenuItems.settings:
        //Do something
        break;
      case MenuItems.darkMode:
        Get.changeThemeMode(ThemeService().loadThemeFromBox()
            ? ThemeMode.light
            : ThemeMode.dark);
        ThemeService().saveThemeToBox(!ThemeService().loadThemeFromBox());
        //Do something
        break;
      case MenuItems.logout:
        //Do something
        LoginController().signOut();
        break;
    }
  }
}
