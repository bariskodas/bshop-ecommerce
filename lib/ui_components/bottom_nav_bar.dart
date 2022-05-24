
// import 'dart:io' as io;

import '../riverpod/riverpods.dart';
import '../utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 4.0, left: 16, right: 16),
        child: GNav(
          gap: 8,
          activeColor: Constants.orangeColor,
          tabBackgroundColor: const Color(0xFFFCF1E7),
          padding: const EdgeInsets.all(8),
          tabBorderRadius: 12,
          onTabChange: (int index) {
          ref.watch(bottomNavbarRiverpod).setIndex(index);
          },
          tabs: const [
            GButton(icon: Icons.home_filled, text: "Home", ),
            GButton(icon: Icons.shopping_cart, text: "Cart"),
            GButton(icon: Icons.person_rounded, text: "Profile"),
            GButton(icon: CupertinoIcons.device_phone_portrait, text: "Device"),
          ],
          
        ),
      ),
    );
  }
}

