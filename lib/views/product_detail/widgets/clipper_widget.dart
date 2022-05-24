
import '../../../utils/constants.dart';
import 'package:flutter/material.dart';

class ProductClipperWidget extends StatelessWidget {
  const ProductClipperWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return ClipPath(
      clipper: ProductClipper(),
      child: Container(
        color: Constants.accentGreyColor,
        height: 450,
        width: double.maxFinite,
      ));
  }
}



class ProductClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 150);
    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height-150);
    path.lineTo(size.width, 0);

return path;
  //  throw UnimplementedError();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
  
}