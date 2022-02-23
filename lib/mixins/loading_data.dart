
library ui_mixins;

import 'package:flutter/cupertino.dart';
import 'package:ui_mixins/mixins/loadble/dialog_type.dart';

class LoadingData {
  LoadingData({required this.style,required this.asset, required this.type});

  //

  final TextStyle style;

  final Image asset;

  final DialogType type;
}
