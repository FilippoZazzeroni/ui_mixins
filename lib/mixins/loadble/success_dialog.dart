

import 'package:flutter/material.dart';
import 'package:ui_mixins/mixins/loadble/loading_dialog.dart';


class SuccessfulDialog extends LoadingDialog {

  const SuccessfulDialog({Key? key, required this.asset}) : super(key: key);

  final Image asset;

  @override
  List<Widget> createChildren() {
    return [
      SizedBox(
          height: 100,
          child: asset),
      createLoadingText("Done", style: const TextStyle(color: Colors.black))
    ];
  }
}
