import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: must_be_immutable
class ProductsWidget extends ConsumerWidget {
  List<Widget> viewChildren;
   ProductsWidget({
     Key? key,
    required this.viewChildren,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.6,
            children: viewChildren,
          );
  }
}
