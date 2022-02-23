
library ui_mixins;

import 'package:flutter/material.dart';
import 'package:ui_mixins/mixins/loading_data.dart';

mixin Loadable {
  /// Shows the loading dialog by presenting a dialog as a modal sheet with spinning indicator.
  void showLoadingDialog(BuildContext context, LoadingData data) =>
      _createLoadingDialog(context, data);

  void dismiss(BuildContext context) {
    Navigator.pop(context);
  }

  void _createLoadingDialog(BuildContext context, LoadingData data) {
    showGeneralDialog(
      context: context,
      transitionDuration: const Duration(milliseconds: 250),
      transitionBuilder: (context, animation, _, child) =>
          _createTransitionView(animation: animation, child: child),
      pageBuilder: (context, animation, secondaryAnimation) {
        return _createHeaderView(context,
            closeButton: _closeButton(context, callback: () {
              Navigator.of(context).pop();
            }, style: data.style),
            children: [
              _createSpinningIndicatorWithSuccessImage(asset: data.asset),
              _createLoadingText("Loading ...", style: data.style),
            ]);
      },
      barrierColor: Colors.transparent,
    );
  }

  Widget _createHeaderView(BuildContext context,
      {required Widget closeButton, required List<Widget> children}) {
    return SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
      Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.down,
        onDismissed: (direction) {
          Navigator.of(context, rootNavigator: true).pop();
        },
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 5.0)
                ]),
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: children,
              ),
            ),
          ),
        ),
      ),
      closeButton
    ]));
  }

  Widget _createTransitionView(
      {required Animation<double> animation, required Widget child}) {
    return SlideTransition(
        position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
            .animate(animation),
        child: child);
  }

  Widget _createSpinningIndicatorWithSuccessImage({required Image asset}) {
    return SizedBox(
      height: 70.0,
      width: 70.0,
      child: Stack(
        children: [
          asset,
          const Center(
              child: SizedBox(
                  height: 80,
                  width: 80,
                  child: const CircularProgressIndicator())),
        ],
      ),
    );
  }

  Widget _createLoadingText(String text, {required TextStyle style}) {
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20.0),
        child: Text(
          text,
          style: style,
        ),
      ),
    );
  }

  Widget _closeButton(BuildContext context,
      {required void Function() callback, required TextStyle style}) {
    return Container(
      color: Colors.red,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      height: 80,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateColor.resolveWith((states) => Colors.white),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ))),
          onPressed: callback,
          child: Text(
            "Close",
            style: style,
          )),
    );
  }
}
