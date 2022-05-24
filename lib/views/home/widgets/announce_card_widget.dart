
import '../../../ui_components/medium_title_widget.dart';
import '../../../utils/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Announce extends StatelessWidget {
  String text;
  Color textColor;
  String imageUrl;
  List<Color> cardColors;
  Color buttonColor;
  Color buttonTextColor;
  Announce({
    Key? key,
    required this.text,
    required this.textColor,
    required this.imageUrl,
    required this.cardColors,
    required this.buttonColor,
    required this.buttonTextColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.hPadding8,
      child: Container(
        height: 150,
        width: 300,
        child: Row(
          children: [
            const SizedBox(width: 10),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MediumTitleText(text: text, color: Colors.white, size: 22),
                  Container(height: 40, width: 100,
                  child: Center(child: Text("Get Now", style: TextStyle(color: buttonTextColor, fontWeight: FontWeight.bold))),
                   decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.circular(50)),)
                ],
              )),
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 150,
                  width: double.maxFinite,
                  child: Image.network(imageUrl, fit: BoxFit.fitHeight,)))
          ],
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: cardColors),
          borderRadius: BorderRadius.circular(12)
        ),
      ),
    );
  }
}