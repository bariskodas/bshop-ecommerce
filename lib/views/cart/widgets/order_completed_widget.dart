import 'package:bariskodas_testc/ui_components/large_button.dart';
import 'package:bariskodas_testc/ui_components/medium_title_widget.dart';
import 'package:bariskodas_testc/utils/constants.dart';
import 'package:flutter/material.dart';

class OrderCompletedWidget extends StatelessWidget {
  const OrderCompletedWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return     Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
      Icon(Icons.done, color: Constants.orangeColor, size: 200),
      Padding(
        padding: Constants.hPadding16,
        child: MediumTitleText(text: "Your order is preparing, will reach you as soon as possible.", size: 20),
      ),
      LargeButton(text: "OK", onPressed: ()=>Navigator.pop(context))
    ],);
  }
}