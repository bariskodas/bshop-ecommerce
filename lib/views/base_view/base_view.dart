import '../../riverpod/riverpods.dart';
import '../../ui_components/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BaseView extends ConsumerWidget {
  const BaseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
body: SafeArea(
  child:   IndexedStack(index: ref.watch(bottomNavbarRiverpod).selectedIndex,
  children: ref.read(bottomNavbarRiverpod).pageViews),
),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}