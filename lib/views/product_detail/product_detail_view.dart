import 'package:bariskodas_testc/api/models/product_model.dart';
import 'package:bariskodas_testc/riverpod/riverpods.dart';
import 'package:bariskodas_testc/ui_components/large_button.dart';
import 'package:bariskodas_testc/ui_components/medium_title_widget.dart';
import 'package:bariskodas_testc/utils/color_model.dart';
import 'package:bariskodas_testc/utils/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'widgets/color_option.dart';
import 'widgets/product_cover_widget.dart';

class ProductDetailPage extends ConsumerStatefulWidget {
  ProductModel product;
  ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProductDetailPageState();
}

class _ProductDetailPageState extends ConsumerState<ProductDetailPage> {
  String selectedColor = "Red";
  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.maxFinite,
          height: _height < 900 ? _height * 1.1 : _height,
          child: Stack(
            children: [
              // cover
              ProductCoverWidget(imageUrl: widget.product.image.toString()),
              // product details
              Positioned(
                top: 380,
                left: 10,
                right: 10,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: Constants.hPadding16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // product name
                        MediumTitleText(
                            text: widget.product.title.toString(),
                            size: 18,
                            fontWeight: FontWeight.w900),
                        // rating
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.star_rate_rounded,
                                  color: Constants.yellowColor, size: 36),
                              MediumTitleText(
                                  text: widget.product.rating!.rate.toString()),
                              const SizedBox(width: 20),
                              MediumTitleText(
                                  text:
                                      "(${widget.product.rating!.count} Reviews)",
                                  size: 14,
                                  fontWeight: FontWeight.w500)
                            ]),
                        const SizedBox(height: 10),
                        // price and stock
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MediumTitleText(
                                  text: "\$" + widget.product.price.toString(),
                                  size: 24),
                              MediumTitleText(
                                  text: "Avaliable in stock", size: 12),
                            ]),
                        const SizedBox(height: 20),
                        // Colors
                        Padding(
                          padding: Constants.vPadding8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              for (var item in ColorModel.colorList)
                                GestureDetector(
                                    onTap: () {
                                      selectedColor = item.colorName;
                                      setState(() {});
                                    },
                                    child: ColorOption(
                                        colorName: item.colorName,
                                        color: item.color,
                                        selectedColor: selectedColor))
                            ],
                          ),
                        ),
                        // About
                        MediumTitleText(
                            text: "About", fontWeight: FontWeight.w500),
                        Text(widget.product.description.toString(),
                            overflow: TextOverflow.visible),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: LargeButton(
          text: "Add to Cart",
          onPressed: () {
            ref
                .read(cartRiverpod)
                .addToProductList(widget.product, selectedColor);
          }),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}
