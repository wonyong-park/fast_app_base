import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';

class AnimatedAppBar extends StatefulWidget {
  final String title;
  final ScrollController controller;

  const AnimatedAppBar(
    this.title, {
    super.key,
    required this.controller,
  });

  @override
  State<AnimatedAppBar> createState() => _AnimatedAppBarState();
}

class _AnimatedAppBarState extends State<AnimatedAppBar> {
  final duration = 250.ms;
  double scrollPosition = 0;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(
      () {
        setState(() {
          scrollPosition = widget.controller.position.pixels;
        });
      },
    );
  }

  bool get isTriggered => scrollPosition > 80;
  bool get isNotTriggered => !isTriggered;

  double getValue(double initial, double target) {
    if(isTriggered) {
      return target;
    }

    double fraction = scrollPosition / 80;
    return initial + (target - initial) * fraction;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: context.backgroundColor,
      child: SafeArea(
        child: Stack(children: [
          Tap(
            onTap: () {
              Nav.pop(context);
            },
            child: const Arrow(
              direction: AxisDirection.left,
            ).p20(),
          ),
          AnimatedContainer(
            duration: duration,
            padding: EdgeInsets.only(left: getValue(20,50), top: getValue(50, 15)),
            child: AnimatedDefaultTextStyle(
              duration: duration,
              style: TextStyle(fontSize: isNotTriggered ? 30 : 18),
              child: widget.title.text.make(),
            ),
          ),
        ]),
      ),
    );
  }
}
