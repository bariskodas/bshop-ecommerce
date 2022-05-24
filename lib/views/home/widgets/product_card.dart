import '../../../api/models/product_model.dart';
import '../../../utils/constants.dart';
import '../../product_detail/product_detail_view.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductCard extends StatelessWidget {
  String title, price, image;
  ProductModel productDetails;
   ProductCard({
    Key? key,
    required this.title,
    required this.price,
    required this.image,
    required this.productDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
onTap: () {
  Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetailPage(product: productDetails)));
},
      child: Container(
        decoration: BoxDecoration(
          color: Constants.accentGreyColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
          Expanded(
            flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(image, fit: BoxFit.contain,),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                  Text(title, maxLines: 2),
                    Text("\$"+price, style: const TextStyle(fontWeight: FontWeight.bold)),
                ],),
              ),
            ),
          ],
        ),
        ),
    );
  }
}
