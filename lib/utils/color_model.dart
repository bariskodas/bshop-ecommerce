import 'package:flutter/material.dart';

class ColorModel {
  String colorName;
  Color color;
  ColorModel({
    required this.colorName,
    required this.color,
  });

  static List<ColorModel> colorList = [
    ColorModel(colorName: "Red", color: Colors.red),
    ColorModel(colorName: "Purple", color: Colors.purple),
    ColorModel(colorName: "Blue", color: Colors.blue),
    ColorModel(colorName: "Green", color: Colors.green),
    ColorModel(colorName: "Black", color: Colors.black)
  ];
}
