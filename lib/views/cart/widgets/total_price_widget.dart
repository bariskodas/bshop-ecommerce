import 'package:bariskodas_testc/riverpod/riverpods.dart';
import 'package:bariskodas_testc/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class TotalPriceWidget extends ConsumerWidget {
  const TotalPriceWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Total",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600, fontSize: 20)),
          Text(
            "\$" +
                ref
                    .watch(cartRiverpod)
                    .calculateTotalPrice()
                    .toStringAsFixed(2),
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Constants.orangeColor),
          )
        ],
      ),
    );
  }
}
