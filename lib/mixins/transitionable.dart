library ui_mixins;

import 'package:flutter/cupertino.dart';

mixin Transitionable {
  Widget transitionBuilder(
      BuildContext context, Animation<double> animation, Widget child) {
    return SlideTransition(
        position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
            .animate(animation),
        child: child);
  }
}
