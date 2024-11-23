import 'package:fast_app_base/common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;
  final EdgeInsets padding;
  final VoidCallback onTap;

  const ImageButton({
    required this.imagePath,
    this.width = 26,
    this.height = 26,
    this.padding = const EdgeInsets.all(10.0),
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Tap(
        onTap: onTap,
        child: Image.asset(
          imagePath,
          width: width,
          height: height,
        ),
      ),
    );
  }
}
