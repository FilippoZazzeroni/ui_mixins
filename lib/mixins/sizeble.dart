library ui_mixins;

import 'package:flutter/cupertino.dart';

mixin Sizeable {
  double height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}