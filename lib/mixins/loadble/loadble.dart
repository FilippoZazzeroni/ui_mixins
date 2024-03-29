
library ui_mixins;

import 'package:flutter/material.dart';
import 'package:ui_mixins/export.dart';
import 'package:ui_mixins/mixins/loadble/dialog/dialog_factory.dart';
import 'package:ui_mixins/mixins/loadble/loading_data.dart';

mixin Loadable {
  /// Shows the loading dialog by presenting a dialog as a modal sheet with spinning indicator.
  Future showLoadingDialog(BuildContext context, LoadingData data) =>
      _createLoadingDialog(context, data);

  void dismiss(BuildContext context) {
    Navigator.pop(context);
  }

  Future _createLoadingDialog(BuildContext context, LoadingData data) {

    final factory = DialogFactory();
    final dialog = factory.create(data);

    return showGeneralDialog(
      context: context,
      transitionDuration: const Duration(milliseconds: 250),
      transitionBuilder: (context, animation, _, child) =>
          _createTransitionView(animation: animation, child: child),
      pageBuilder: (context, animation, secondaryAnimation) {
        return dialog;
      },
      barrierColor: Colors.transparent,
    );
  }

  Widget _createTransitionView(
      {required Animation<double> animation, required Widget child}) {
    return SlideTransition(
        position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
            .animate(animation),
        child: child);
  }

}
