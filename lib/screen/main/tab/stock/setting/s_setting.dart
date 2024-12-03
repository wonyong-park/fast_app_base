import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/datetime_extension.dart';
import 'package:fast_app_base/common/data/preference/app_preferences.dart';
import 'package:fast_app_base/common/data/preference/prefs.dart';
import 'package:fast_app_base/screen/main/tab/stock/setting/d_number.dart';
import 'package:fast_app_base/screen/main/tab/stock/setting/w_animated_app_bar.dart';
import 'package:fast_app_base/screen/main/tab/stock/setting/w_swtich_menu.dart';
import 'package:fast_app_base/screen/opensource/s_opensource.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> with SingleTickerProviderStateMixin {
  final scrollController = ScrollController();
  late final AnimationController animationController = AnimationController(vsync: this, duration: 2000.ms);

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            controller: scrollController,
            padding: const EdgeInsets.only(top: 150),
            children: [
              Obx(
                () => SwitchMenu(
                  '푸쉬 설정',
                  Prefs.isPushOnRx.get(),
                  onChanged: (isOn) {
                    Prefs.isPushOnRx.set(isOn);
                  },
                ),
              ),
              Obx(
                () => Slider(
                  value: Prefs.sliderPosition.get(),
                  onChanged: (value) {
                    animationController.animateTo(value, duration: 0.ms);
                    Prefs.sliderPosition.set(value);
                  },
                ),
              ),
              Obx(
                () => BigButton(
                  '날짜 ${Prefs.birthday.get() == null ? '' : Prefs.birthday.get()?.formattedDate}',
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now().subtract(90.days),
                      lastDate: DateTime.now().add(90.days),
                    );

                    if (date == null) {
                      return;
                    }

                    Prefs.birthday.set(date);
                  },
                ),
              ),
              Obx(
                () => BigButton(
                  '저장된 숫자 ${Prefs.number.get()}',
                  onTap: () async {
                    final number = await NumberDialog().show();

                    if (number == null) {
                      return;
                    }

                    Prefs.number.set(number);
                  },
                ),
              ),
              BigButton('Animation forward', onTap: () {
                animationController.forward();
              }),
              BigButton('Animation reverse', onTap: () {
                animationController.reverse();
              }),
              BigButton('Animation repeat', onTap: () {
                animationController.repeat();
              }),
              BigButton('Animation reset', onTap: () {
                animationController.reset();
              }),
              ...List.generate(
                10,
                (index) => BigButton('오픈소스 화면', onTap: () async {
                  Nav.push(const OpensourceScreen());
                }),
              ),
            ],
          ),
          AnimatedAppBar(
            '설정',
            scrollController: scrollController,
            animationController: animationController,
          ),
        ],
      ),
    );
  }
}
