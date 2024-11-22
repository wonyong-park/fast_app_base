import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/benefit/vo/vo_benefit.dart';
import 'package:flutter/material.dart';

class BenefitItem extends StatelessWidget {
  final Benefit benefit;

  const BenefitItem({required this.benefit, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          benefit.imagePath,
          width: 50,
          height: 50,
        ),
        width10,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            benefit.subTitle.text.size(13).make(),
            height5,
            benefit.title.text.size(13).color(context.appColors.blueText).make(),
          ],
        ),
      ],
    ).pSymmetric(v: 20);
  }
}
