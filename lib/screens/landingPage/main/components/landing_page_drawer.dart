import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LandingPageDrawer extends StatelessWidget {
  const LandingPageDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Column(
            children: [
              DrawerHeader(
                child: Image.asset("assets/images/logo.png"),
              ),
              DrawerListTile(
                title: "Home",
                icon: Icons.home,
                press: () {},
              ),
              DrawerListTile(
                title: "About Us",
                icon: Icons.home,
                press: () {},
              ),
              DrawerListTile(
                title: "Contact Us",
                icon: Icons.home,
                press: () {},
              ),
              DrawerListTile(
                title: "Help",
                icon: Icons.home,
                press: () {},
              ),
            ],
          ),
          Expanded(child: Container()),
          Column(
            children: [
              DrawerListTile(
                title: "Sign In",
                icon: Icons.home,
                press: () {},
              ),
              DrawerListTile(
                title: "Register",
                icon: Icons.home,
                press: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  DrawerListTile(
      {Key? key,
      // For selecting those three line once press "Command+D"
      required this.title,
      this.svgSrc,
      required this.press,
      this.icon})
      : super(key: key);

  var icon;
  var svgSrc;
  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: svgSrc != null
          ? SvgPicture.asset(
              svgSrc,
              color: Colors.white54,
              height: 16,
            )
          : Icon(icon),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
