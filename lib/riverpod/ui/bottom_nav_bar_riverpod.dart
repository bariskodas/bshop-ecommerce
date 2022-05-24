import 'package:flutter/material.dart';

import '../../views/cart/cart_view.dart';
import '../../views/device/device_view.dart';
import '../../views/home/home_view.dart';
import '../../views/profile/profile_view.dart';

class BottomNavbarRiverpod extends ChangeNotifier{

List<Widget> pageViews = const [
  HomePage(),
  CartPage(),
  ProfilePage(),
  DevicePage()
];

int selectedIndex = 0;

  void setIndex(int index){
    selectedIndex = index;
    notifyListeners();
  }
  
  setView() => pageViews[selectedIndex];

}