import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulpox_admin/controllers/LoginController/login_controller.dart';

import '../../constants.dart';
import '../../responsive.dart';

class ProfileLoginButton extends GetView<LoginController> {
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
    final LoginController controller =
        Get.put<LoginController>(LoginController());
    return DropdownButtonHideUnderline(
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
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
                // Container(
                //   child: controller.myUser?.foto == null
                //       ? Icon(
                //           Icons.account_circle,
                //           size: 90,
                //           color: Colors.grey,
                //         )
                //       : ClipRRect(
                //           borderRadius: BorderRadius.circular(45),
                //           child: Image.network(
                //             controller.myUser?.foto,
                //             fit: BoxFit.cover,
                //             width: MediaQuery.of(context).size.height * .1,
                //             height: MediaQuery.of(context).size.height * .1,
                //             errorBuilder: (context, object, stackTrace) {
                //               return Icon(
                //                 Icons.account_circle,
                //                 size: 45,
                //                 color: Colors.grey,
                //               );
                //             },
                //             loadingBuilder: (BuildContext context, Widget child,
                //                 ImageChunkEvent? loadingProgress) {
                //               if (loadingProgress == null) return child;
                //               return Container(
                //                 width: 90,
                //                 height: 90,
                //                 child: Center(
                //                   child: CircularProgressIndicator(
                //                     color: Colors.grey,
                //                     value: loadingProgress.expectedTotalBytes !=
                //                                 null &&
                //                             loadingProgress
                //                                     .expectedTotalBytes !=
                //                                 null
                //                         ? loadingProgress
                //                                 .cumulativeBytesLoaded /
                //                             loadingProgress.expectedTotalBytes!
                //                         : null,
                //                   ),
                //                 ),
                //               );
                //             },
                //           ),
                //         ),
                // ),

                CachedNetworkImage(
                  imageUrl:
                      "https://lh3.googleusercontent.com/a/ALm5wu2b1rkWGWIaQ1PcGTX6hbtE5Q_gJgkY-XCwn0-K=s96-c",
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.red, BlendMode.colorBurn)),
                    ),
                  ),
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                Image.asset(
                  "assets/images/profile_pic.png",
                  height: 38,
                ),
                if (!Responsive.isMobile(context))
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: defaultPadding / 2),
                    child: Text(
                      controller.myUser!.nickname,
                      style: TextStyle(
                          color: Theme.of(context)
                              .primaryTextTheme
                              .subtitle1!
                              .color),
                    ),
                  ),
              ],
            ),
          ),
          customItemsHeights: [
            ...List<double>.filled(MenuItems.firstItems.length, 48),
            8,
            ...List<double>.filled(MenuItems.secondItems.length, 48),
          ],
          items: [
            ...MenuItems.firstItems.map(
              (item) => DropdownMenuItem<MenuItem>(
                value: item,
                child: MenuItems.buildItem(context, item),
              ),
            ),
            const DropdownMenuItem<Divider>(enabled: false, child: Divider()),
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
  static const List<MenuItem> firstItems = [home, share, settings];
  static const List<MenuItem> secondItems = [logout];

  static const home = MenuItem(text: 'Home', icon: Icons.home);
  static const share = MenuItem(text: 'Share', icon: Icons.share);
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
        //Do something
        break;
      case MenuItems.settings:
        //Do something
        break;
      case MenuItems.share:
        //Do something
        break;
      case MenuItems.logout:
        //Do something
        LoginController().signOut();
        break;
    }
  }
}
