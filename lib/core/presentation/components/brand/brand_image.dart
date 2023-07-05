import 'package:flutter/material.dart';

class BrandImageWidget extends StatelessWidget {
  final double width;
  final double height;

  const BrandImageWidget({this.width =  80, this.height = 80});

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/brand/brand.png', width: width, height: height, fit: BoxFit.fitWidth,);
  }
}