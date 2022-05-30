import 'package:bariskodas_testc/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HelloWidget extends StatelessWidget {
  const HelloWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.hPadding24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text("Hello, Grogu ",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Constants.blackColor)),
              SizedBox(
                  height: 24,
                  width: 36,
                  child: Image.asset("assets/grogu.png")),
            ],
          ),
          Text(
            "Lets gets somethings?",
            style: TextStyle(fontSize: 16, color: Constants.darkGreyColor),
          ),
        ],
      ),
    );
  }
}
