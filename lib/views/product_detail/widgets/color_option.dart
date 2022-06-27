import 'package:flutter/material.dart';

import 'package:bariskodas_testc/utils/constants.dart';

class ColorOption extends StatelessWidget {
  String colorName;
  Color color;
   ColorOption({
    Key? key,
    required this.colorName,
    required this.color,
    required this.selectedColor,
  }) : super(key: key);

  final String selectedColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      width: 36,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: selectedColor == colorName ? Constants.darkGreyColor : Colors.transparent)),
              child: Padding(
                padding: Constants.allPadding2,
                child: Container(decoration: BoxDecoration(shape: BoxShape.circle, color: color),),
              ),
    );
  }
}
