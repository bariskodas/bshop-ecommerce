import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


// ignore: must_be_immutable
class MediumTitleText extends StatelessWidget {
  String text;
  double size;
  Color color;
  FontWeight fontWeight;
  MediumTitleText({
    Key? key,
    required this.text,
    this.size = 16,
    this.color = const Color(0xFF4F463D),
    this.fontWeight = FontWeight.w700
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, maxLines: 2, style: GoogleFonts.poppins(
      fontSize: size,
      color: color,
      fontWeight: fontWeight
    ),);
  }
}
