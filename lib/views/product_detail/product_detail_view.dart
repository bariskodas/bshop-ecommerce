import '../../api/models/product_model.dart';
import '../../riverpod/riverpods.dart';
import '../../ui_components/large_button.dart';
import '../../ui_components/medium_title_widget.dart';
import '../../utils/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'widgets/product_cover_widget.dart';

// ignore: must_be_immutable
class ProductDetailPage extends ConsumerWidget {
  ProductModel product;
   ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.maxFinite,
          height: _height < 900 ? _height * 1.3 : _height,
          child: Stack(
            children:  [
          // cover
          ProductCoverWidget(imageUrl: product.image.toString()),
            // product details
            Positioned(
      top: 380,
      left: 10,
      right: 10,
          child: SingleChildScrollView(
            child: Padding(
              padding: Constants.hPadding16,
              child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // product name
                  MediumTitleText(text: product.title.toString(), size: 18, fontWeight: FontWeight.w900),
                  // rating
                  Row( mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                    Icon(Icons.star_rate_rounded, color: Constants.yellowColor, size: 36),
                    MediumTitleText(text: product.rating!.rate.toString()), 
                    const SizedBox(width: 20),
                    MediumTitleText(text: "(${product.rating!.count} Reviews)", size: 14, fontWeight: FontWeight.w500)
                  ]),
                  const SizedBox(height: 10),
                  // price and stock
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    MediumTitleText(text: "\$"+product.price.toString(), size: 24),
                    MediumTitleText(text: "Avaliable in stock", size: 12),
                  ]),
                  const SizedBox(height: 20),
                  // About
                  MediumTitleText(text: "About", fontWeight: FontWeight.w500),
                  Text(product.description.toString(), overflow: TextOverflow.visible),
                ],
              ),
            ),
          ),
            ),
            ],
          ),
        ),
      ),
      floatingActionButton: LargeButton(text: "Add to Cart", onPressed: (){
        ref.read(cartRiverpod).addToProductList(product);
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}
