import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:tubes_mobpro/tubes/pages/activity.dart';
import 'package:tubes_mobpro/tubes/pages/homePage_screen.dart';

import 'package:tubes_mobpro/tubes/pages/home_page.dart';
import 'package:tubes_mobpro/tubes/pages/discount_page.dart';
import 'package:tubes_mobpro/tubes/pages/account_page.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: _controller,
      context,
      screens: _buildScreens(),
      items: _navBarsItems(),
      navBarStyle: NavBarStyle.style3,
    );
  }

  List<Widget> _buildScreens() {
    return [const HomepageScreen(), const ActivityPage(), DiscountPage(), const AccountPage()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      BottomNavItem('Home', const Icon(Icons.home)),
      BottomNavItem('Activity', const Icon(Icons.bolt)),
      BottomNavItem('Discount', const Icon(Icons.tag)),
      BottomNavItem('Account', const Icon(Icons.person)),
    ];
  }

  PersistentBottomNavBarItem BottomNavItem(String navName, Icon navIcon) {
    return PersistentBottomNavBarItem(
        icon: navIcon,
        title: (navName),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        routeAndNavigatorSettings: BottomNavRoute());
  }

  RouteAndNavigatorSettings BottomNavRoute() {
    return RouteAndNavigatorSettings(
      initialRoute: "/",
      routes: {
        "/first": (final context) => const HomepageScreen(),
        "/second": (final context) => const ActivityPage(),
        "/third": (final context) => DiscountPage(),
        "/fourth": (final context) => const AccountPage(),
      },
    );
  }
}
