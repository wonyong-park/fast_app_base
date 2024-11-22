import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_arrow.dart';
import 'package:flutter/material.dart';

class PointButton extends StatelessWidget {
  final int point;

  const PointButton({required this.point, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        '내포인트'.text.color(context.appColors.lessImportant).make(),
        emptyExpanded,
        '$point 원'.text.bold.make(),
        width10,
        Arrow(color: context.appColors.lessImportant,),
        height20,
      ],
    );
  }
}
