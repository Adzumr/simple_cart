import 'package:cart/main.dart';
import 'package:cart/screens/cart_screen.dart';
import 'package:cart/screens/favorite_screen.dart';
import 'package:cart/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PersistentTabController controller;

    controller = PersistentTabController(initialIndex: 0);
    List<PersistentBottomNavBarItem> bottomItems = [
      PersistentBottomNavBarItem(
        title: "Home",
        icon: const Icon(
          Icons.home,
        ),
      ),
      PersistentBottomNavBarItem(
        title: "Note",
        icon: const Icon(
          Icons.note,
        ),
      ),
      PersistentBottomNavBarItem(
        title: "Favorite",
        activeColorPrimary: appColors.redColor,
        activeColorSecondary: appColors.whiteColor,
        icon: Icon(
          Icons.favorite_outline,
          color: appColors.whiteColor,
        ),
      ),
      PersistentBottomNavBarItem(
        title: "Cart",
        icon: const Icon(
          Icons.shopping_cart_outlined,
        ),
      ),
      PersistentBottomNavBarItem(
        title: "Cart",
        icon: const Icon(
          Icons.shopping_cart_outlined,
        ),
      ),
    ];

    return PersistentTabView(
      context,
      controller: controller,
      screens: const [
        HomeScreen(),
        HomeScreen(),
        HomeScreen(),
        FavoriteScreen(),
        CartScreen(),
      ],
      items: bottomItems,
      confineInSafeArea: true,

      backgroundColor: appColors.fishColor, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: appColors.fishColor),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style15, // Choose the nav bar style with this property.
    );
  }
}
