import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:flutter/material.dart';
import 'package:nav/dialog/dialog.dart';

class NumberDialog extends DialogWidget<int> {
  NumberDialog({
    super.key,
    super.animation = NavAni.Fade,
  });

  @override
  DialogState<NumberDialog> createState() => _NumberDialogState();
}

class _NumberDialogState extends DialogState<NumberDialog> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RoundedContainer(
            child: Column(
              children: [
                '숫자를 입력해주세요'.text.make(),
                TextField(
                  controller: controller,
                  keyboardType: TextInputType.number,
                ),
                RoundButton(
                  text: '완료',
                  onTap: () {
                    int? number = int.tryParse(controller.text);
                    widget.hide(number);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
