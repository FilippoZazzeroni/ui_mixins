

import 'package:flutter/material.dart';
import 'package:ui_mixins/mixins/loadble/dialog/loading_dialog.dart';


class SuccessfulDialog extends LoadingDialog {

  const SuccessfulDialog({Key? key, required this.asset}) : super(key: key);

  final Image asset;

  @override
  List<Widget> createChildren() {
    return [
      SizedBox(
          height: 60,
          child: asset),
      createLoadingText("Done", style: const TextStyle(color: Colors.black))
    ];
  }

  @override
  Widget buildPopButton(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: SizedBox()),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: IconButton(onPressed: () => pop(context), icon: const Icon(Icons.clear, color: Colors.black,)),
        )
      ],
    );
  }
}
