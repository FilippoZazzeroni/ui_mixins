
library ui_mixins;

import 'package:flutter/material.dart';

mixin Navigable {
  void push(BuildContext context,  {required Widget page}) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return page;
    }));
  }

  void pop(BuildContext context) {
    Navigator.pop(context);
  }
}