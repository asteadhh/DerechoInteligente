import 'package:derecho_inteligente/constants/custom_colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../widgets/web_scrollbar.dart';
import '/controllers/LoginController/login_controller.dart';

import '../../../widgets/bottom_bar.dart';
import '/routes/app_pages.dart';
import '/widgets/explore_drawer.dart';
import '/widgets/responsive.dart';
import '/widgets/top_bar_contents.dart';

class LandingPageBase extends StatefulWidget {
  LandingPageBase({required this.widget});

  Widget widget;

  @override
  _LandingPageBaseState createState() => _LandingPageBaseState(
        widgets: widget,
      );
}

class _LandingPageBaseState extends State<LandingPageBase> {
  _LandingPageBaseState({required this.widgets});

  Widget widgets;
  late ScrollController _scrollController;
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Get.put<LoginController>(LoginController());
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      extendBodyBehindAppBar: true,
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              backgroundColor:
                  // Theme.of(context).bottomAppBarColor.withOpacity(_opacity),
                  Theme.of(context).bottomAppBarColor.withOpacity(1),
              elevation: 0,
              centerTitle: true,

              // actions: [
              //   IconButton(
              //     icon: 'idioma'.tr == 'Español'
              //         ? SvgPicture.asset('icons/flags/svg/cl.svg',
              //             package: 'country_icons')
              //         : SvgPicture.asset('icons/flags/svg/us.svg',
              //             package: 'country_icons'),
              //     splashColor: Colors.transparent,
              //     highlightColor: Colors.transparent,
              //     onPressed: () {
              //       'idioma'.tr == 'Español'
              //           ? Get.updateLocale(Locale('en', 'US'))
              //           : Get.updateLocale(Locale('es', 'ES'));
              //     },
              //   ),
              //   IconButton(
              //     icon: Icon(Icons.brightness_6),
              //     splashColor: Colors.transparent,
              //     highlightColor: Colors.transparent,
              //     onPressed: () {
              //       //CHANGE THEME MODE
              //       // EasyDynamicTheme.of(context).changeTheme();

              //       Get.changeThemeMode(ThemeService().loadThemeFromBox()
              //           ? ThemeMode.light
              //           : ThemeMode.dark);w
              //       ThemeService()
              //           .saveThemeToBox(!ThemeService().loadThemeFromBox());
              //     },
              //   ),
              // ],
              leading: GestureDetector(
                onTap: () {
                  Get.toNamed(AppPages.main);
                },
                child: Container(
                  height: 40,
                  width: 40,
                  // color: Colors.red,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child:
                        // Image.asset('assets/images/output-onlinejpgtools.png'),
                        SvgPicture.asset(
                      // color: Colors.red,

                      Constants.LogoSvg,
                    ),
                  ),
                ),
              ),
              //   iconTheme: IconThemeData(
              //       color: _opacity == 0 ? Colors.black : Colors.white),
              // )
              iconTheme: IconThemeData(color: Colors.white),
            )
          : PreferredSize(
              preferredSize: Size(screenSize.width, 1000),
              child: TopBarContents(),
            ),
      endDrawer: ExploreDrawer(),
      body: WebScrollbar(
        color: Colors.blueGrey,
        backgroundColor: Colors.blueGrey.withOpacity(0.3),
        width: 10,
        heightFraction: 0.3,
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: ClampingScrollPhysics(),
          // child: HomeLanding(content: widgets),
          child: Column(
            children: [
              // SizedBox(
              //   height: 10,
              // ),
              widgets,
              SizedBox(height: screenSize.height / 10),
              BottomBar(),
            ],
          ),
          // child: HomeLanding(content: Text('ss')),
        ),
      ),
    );
  }
}
