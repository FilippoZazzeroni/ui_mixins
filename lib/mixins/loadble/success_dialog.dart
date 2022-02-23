

import 'package:flutter/material.dart';
import 'package:ui_mixins/mixins/loadble/loading_dialog.dart';


class SuccessfulDialog extends LoadingDialog {

  const SuccessfulDialog({Key? key}) : super(key: key);


  @override
  List<Widget> createChildren() {
    return [
      Image.asset("assets/images/logo"),
      createLoadingText("Done", style: const TextStyle(color: Colors.black))
    ];
  }


}
