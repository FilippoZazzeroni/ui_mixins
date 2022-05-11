

import 'package:flutter/material.dart';
import 'package:ui_mixins/export.dart';

class AnimatedWidgetTest extends StatefulWidget {
  const AnimatedWidgetTest({Key? key}) : super(key: key);

  @override
  State<AnimatedWidgetTest> createState() => _AnimatedWidgetTestState();
}

class _AnimatedWidgetTestState extends State<AnimatedWidgetTest>
    with TickerProviderStateMixin, Transitionable, Sizeable {
  late AnimationController _controller;

  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..forward();
    _animation = Tween<double>(begin: 1, end: 60).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInCubic,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return transitionBuilder(
        context,
        _animation,
        Column(
          children: [
            Container(
                color: Colors.red, width: width(context), height: height(context)),
          ],
        ));
  }
}