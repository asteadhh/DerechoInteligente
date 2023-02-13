import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '/controllers/LoginController/login_controller.dart';

import '../../../constants/theme.dart';
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
                  Theme.of(context).bottomAppBarColor.withOpacity(_opacity),
              elevation: 0,
              centerTitle: true,
              actions: [
                IconButton(
                  icon: 'idioma'.tr == 'Español'
                      ? SvgPicture.asset('icons/flags/svg/cl.svg',
                          package: 'country_icons')
                      : SvgPicture.asset('icons/flags/svg/us.svg',
                          package: 'country_icons'),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    'idioma'.tr == 'Español'
                        ? Get.updateLocale(Locale('en', 'US'))
                        : Get.updateLocale(Locale('es', 'ES'));
                  },
                ),
                IconButton(
                  icon: Icon(Icons.brightness_6),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    //CHANGE THEME MODE
                    // EasyDynamicTheme.of(context).changeTheme();

                    Get.changeThemeMode(ThemeService().loadThemeFromBox()
                        ? ThemeMode.light
                        : ThemeMode.dark);
                    ThemeService()
                        .saveThemeToBox(!ThemeService().loadThemeFromBox());
                  },
                ),
              ],
              title: GestureDetector(
                onTap: () {
                  Get.toNamed(AppPages.main);
                },
                child: Text(
                  'Derecho Inteligente',
                  style: TextStyle(
                    color: Colors.blueGrey[100],
                    fontSize: 20,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 3,
                  ),
                ),
              ),
            )
          : PreferredSize(
              preferredSize: Size(screenSize.width, 1000),
              child: TopBarContents(),
            ),
      drawer: ExploreDrawer(),
      body:
          // WebScrollbar(
          //   color: Colors.blueGrey,
          //   backgroundColor: Colors.blueGrey.withOpacity(0.3),
          //   width: 10,
          //   heightFraction: 0.3,
          //   controller: _scrollController,
          //   child:
          SingleChildScrollView(
        controller: _scrollController,
        physics: ClampingScrollPhysics(),
        // child: HomeLanding(content: widgets),
        child: Column(
          children: [
            widgets,
            SizedBox(height: screenSize.height / 10),
            BottomBar(),
          ],
        ),
        // child: HomeLanding(content: Text('ss')),
        // ),
      ),
    );
  }
}
