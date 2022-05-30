// ignore_for_file: must_be_immutable

import 'package:bariskodas_testc/utils/constants.dart';
import 'package:flutter/material.dart';
import 'medium_title_widget.dart';

class LargeButton extends StatelessWidget {
  String text;
  VoidCallback onPressed;
  LargeButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.hPadding16,
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
            color: Constants.orangeColor,
            borderRadius: BorderRadius.circular(12)),
        child: RawMaterialButton(
            child: MediumTitleText(
                text: text, color: Colors.white, fontWeight: FontWeight.w500),
            onPressed: onPressed),
      ),
    );
  }
}
