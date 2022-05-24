import '../../../ui_components/small_button.dart';
import '../../../utils/constants.dart';
import 'package:flutter/material.dart';



class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.hPadding16,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SmallButton(wIcon: Icons.qr_code_rounded, wOnPressed: () {}),
        SmallButton(wIcon: Icons.search_outlined, wOnPressed: () {}),
      ]),
    );
  }
}