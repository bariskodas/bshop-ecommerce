import 'package:flutter/material.dart';
import 'announce_card_widget.dart';

class AnnouncesWidget extends StatelessWidget {
  const AnnouncesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView(
        scrollDirection: Axis.horizontal,
        
        children: [
          //* Static Datas
          Announce(
            text: "%30 OFF DURING COVID 19",
            cardColors: const [Colors.deepOrange, Colors.orange],
            textColor: Colors.white,
            buttonColor: Colors.white,
            buttonTextColor: Colors.orange,
            imageUrl: "https://purepng.com/public/uploads/large/purepng.com-women-shoppingwomenpeoplepersonsfemaleshopping-11215250879289tvzj.png",
          ),
         Announce(
            text: "YOUR STYLE WILL TELL ABOUT YOU",
            cardColors: [Colors.blue.shade700, Colors.blue.shade400],
            textColor: Colors.white,
            buttonColor: Colors.purple,
            buttonTextColor: Colors.white,
            imageUrl: "https://purepng.com/public/uploads/large/rolex-submariner-date-mpa.png",
          ),
          Announce(
            text: "THE MOST POPULARS TODAY",
            cardColors: [Colors.teal.shade900, Colors.teal],
            textColor: Colors.black,
            buttonColor: Colors.yellow.shade700,
            buttonTextColor: Colors.black,
            imageUrl: "https://purepng.com/public/uploads/large/samsung-galaxy-s10-prism-white-back-kyl.png",
          ),
        ],
      ),
    );
  }
}





