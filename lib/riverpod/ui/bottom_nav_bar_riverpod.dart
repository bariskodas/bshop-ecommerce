import 'package:bariskodas_testc/views/cart/cart_view.dart';
import 'package:bariskodas_testc/views/device/device_view.dart';
import 'package:bariskodas_testc/views/home/home_view.dart';
import 'package:bariskodas_testc/views/profile/profile_view.dart';
import 'package:flutter/material.dart';

class BottomNavbarRiverpod extends ChangeNotifier {
  List<Widget> pageViews = const [
    HomePage(),
    CartPage(),
    ProfilePage(),
    DevicePage()
  ];

  int selectedIndex = 0;

  void setIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  setView() => pageViews[selectedIndex];
}
