import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';

class LongButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const LongButton({
    required this.title,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          title.text.make(),
          emptyExpanded,
          const Arrow(),
        ],
      ),
    );
  }
}
