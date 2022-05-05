
library ui_mixins;

import 'package:flutter/cupertino.dart';
import 'package:ui_mixins/mixins/loadble/dialog/dialog_type.dart';

class LoadingData {
  LoadingData({required this.style, this.asset, required this.type, required this.text});

  //

  final TextStyle style;

  final Image? asset;

  final DialogType type;

  final String text;
}
