import '../utils/constants.dart';
import 'package:flutter/material.dart';



// ignore: must_be_immutable
class SmallButton extends StatelessWidget {
  IconData wIcon;
  VoidCallback? wOnPressed;

   SmallButton({
    Key? key,
    required this.wIcon,
    required this.wOnPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          height: 36,
          width: 36,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Constants.greyColor),
        ),
        IconButton(
            icon: Icon(wIcon, color: Constants.blackColor),
            onPressed: wOnPressed,
          ),
      ],
    );
  }
}
