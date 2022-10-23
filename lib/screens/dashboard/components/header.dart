import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../constants/theme.dart';
import '../../../controllers/platform/PlatformAdminMainScreenController.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/sign_in.dart';
import '/controllers/MenuController.dart';
import '/responsive.dart';
import '../../../constants.dart';

class Header extends GetView<MenuController> {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // Get.lazyPut(() => MenuController());
              // return controller.controlMenu();
              Scaffold.of(context).openDrawer();
            },
          ),
        if (!Responsive.isMobile(context))
          Text(
            "Dashboard",
            style: Theme.of(context).textTheme.headline6,
          ),
        IconButton(
          icon: Icon(Icons.brightness_6),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          color: Theme.of(context).primaryTextTheme.headline6!.color,
          onPressed: () {
            //Change Theme Mode
            // EasyDynamicTheme.of(context).changeTheme();
            Get.changeThemeMode(ThemeService().loadThemeFromBox()
                ? ThemeMode.light
                : ThemeMode.dark);
            ThemeService().saveThemeToBox(!ThemeService().loadThemeFromBox());
          },
        ),
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        Expanded(child: SearchField()),
        ProfileCard()
      ],
    );
  }
}

class ProfileCard extends GetView<MenuController> {
  ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: defaultPadding),
      padding: EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          Image.asset(
            "assets/images/profile_pic.png",
            height: 38,
          ),
          if (!Responsive.isMobile(context))
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
              child: Text("Angelina Jolie"),
            ),
          GestureDetector(
            onTap: () async {
              MenuController().isProcessing.value = false;
              await signOut().then((result) {
                print(result);
                controller.tabIndex.value = 0;
                Get.offAllNamed(AppPages.main);
              }).catchError((error) {
                print('Sign Out Error: $error');
              });
              // setState(() {

              // });
            },
            child: Icon(Icons.keyboard_arrow_down),
          ),
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        // fillColor: Theme.of(context).cardTheme.color,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(defaultPadding * 0.75),
            margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            decoration: BoxDecoration(
              color: primaryColor,
              // color: Theme.of(context).primaryTextTheme.button!.decorationColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: SvgPicture.asset("assets/icons/Search.svg"),
          ),
        ),
      ),
    );
  }
}
