import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../ui_components/medium_title_widget.dart';
import '../../utils/constants.dart';
import 'widgets/announces_widget.dart';
import 'widgets/categories_widget.dart';
import 'widgets/hello_widget.dart';
import 'widgets/home_appbar.dart';



class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isAndroid = Platform.isAndroid;
    return Scaffold(

      body:SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           isAndroid ? const SizedBox(height: 20) : const SizedBox(),
            // QR and search buttons
            const HomeAppBar(),
            const SizedBox(height: 20),
            // welcome message
            const HelloWidget(),
            const SizedBox(height: 20),
            // announces
            const AnnouncesWidget(),
            // categories
            const SizedBox(height: 20),
            Padding(
              padding: Constants.leftPadding24,
              child: MediumTitleText(text: "Categories", size: 20,),
            ),
             // categories TabBar
             const SizedBox(height: 10),
              const CategoriesWidget(),
            
          ],
        ),
      )),
    );
  }
  
}

