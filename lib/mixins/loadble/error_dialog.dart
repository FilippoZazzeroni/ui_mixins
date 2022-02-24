

import 'package:flutter/material.dart';
import 'package:ui_mixins/mixins/loadble/loading_data.dart';
import 'package:ui_mixins/mixins/loadble/loading_dialog.dart';

class ErrorDialog extends LoadingDialog {

  const ErrorDialog({Key? key, required this.data}) : super(key: key);

  final LoadingData data;

  @override
  List<Widget> createChildren() {
    return [
      const Icon(Icons.error, color: Colors.redAccent, size: 40,),
      const SizedBox(height: 20,),
      Material(child: Text(data.text, style: data.style,))
    ];
  }
}