import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import 'package:tubes_mobpro/tubes/pages/home_page.dart';
import 'package:tubes_mobpro/tubes/pages/activity_page.dart';
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
    return [HomePage(), ActivityPage(), DiscountPage(), AccountPage()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      BottomNavItem('Home', Icon(CupertinoIcons.home)),
      BottomNavItem('Activity', Icon(CupertinoIcons.bolt)),
      BottomNavItem('Discount', Icon(CupertinoIcons.tag)),
      BottomNavItem('Account', Icon(CupertinoIcons.person)),
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
        "/first": (final context) => const HomePage(),
        "/second": (final context) => const ActivityPage(),
        "/third": (final context) => const DiscountPage(),
        "/fourth": (final context) => const AccountPage(),
      },
    );
  }
}
