import 'package:bariskodas_testc/riverpod/riverpods.dart';
import 'package:bariskodas_testc/ui_components/medium_title_widget.dart';
import 'package:bariskodas_testc/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: must_be_immutable
class CartProductWidget extends ConsumerWidget {
  String imageURL, title, price, count;
  Key dismissibleKey;
  void Function()? increment;
  void Function()? decrement;
  dynamic dismissed;
  CartProductWidget({
    required this.imageURL,
    required this.title,
    required this.price,
    required this.count,
    required this.increment,
    required this.decrement,
    required this.dismissed,
    required this.dismissibleKey,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Dismissible(
        key: dismissibleKey,
        onDismissed: (_) {
          ref.watch(cartRiverpod).deleteSingleProduct(id: dismissed);
        },
        background: Container(
          color: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Icon(Icons.delete, color: Colors.white, size: 36),
              SizedBox(width: 20)
            ],
          ),
        ),
        direction: DismissDirection.endToStart,
        child: Container(
          height: 120,
          width: double.maxFinite,
          decoration: BoxDecoration(
              color: Constants.accentGreyColor,
              borderRadius: BorderRadius.circular(12)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 5),
              //photo
              Expanded(
                  flex: 1,
                  child: Container(
                    height: 90,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(imageURL)),
                        borderRadius: BorderRadius.circular(12)),
                  )),
              // title and price
              Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MediumTitleText(
                            text: title, fontWeight: FontWeight.w900),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            MediumTitleText(text: "\$" + price, size: 24),
                            // Counter
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12)),
                              height: 40,
                              width: 110,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButton(
                                      onPressed: decrement,
                                      icon: Icon(Icons.remove,
                                          color: Constants.orangeColor)),
                                  MediumTitleText(text: count, size: 18),
                                  IconButton(
                                      onPressed: increment,
                                      icon: Icon(Icons.add,
                                          color: Constants.orangeColor)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
