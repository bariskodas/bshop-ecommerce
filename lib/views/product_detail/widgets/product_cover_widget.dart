import 'package:flutter/material.dart';

import 'clipper_widget.dart';

// ignore: must_be_immutable
class ProductCoverWidget extends StatelessWidget {
  String imageUrl;
   ProductCoverWidget({
    Key? key,
    required this.imageUrl
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        // clipper
         const ProductClipperWidget(),
        //back button
        Positioned(
          top: 50,
          left: 10,
          child: IconButton(onPressed: ()=>Navigator.pop(context), 
          icon: const Icon(Icons.arrow_back)),),
        //photo
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Container(
            height: 270,
            width: 270,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Image.network(imageUrl, fit: BoxFit.contain),
            ),
        ),
      ],
    );
  }
}

