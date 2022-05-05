
import 'package:example/ui/common/animated_widget.dart';
import 'package:flutter/material.dart';
import 'package:ui_mixins/export.dart';

class LoadableView extends StatelessWidget with Loadable {
  const LoadableView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: TextButton(
                  onPressed: () async {
                    showLoadingDialog(
                        context,
                        LoadingData(
                            type: DialogType.loading,
                            text: "errore",
                            style: const TextStyle(color: Colors.black87),
                            ));
                    await Future.delayed(const Duration(seconds: 3));
                    Navigator.pop(context);
                    showLoadingDialog(
                        context,
                        LoadingData(
                            text: "done",
                            type: DialogType.success,
                            style: const TextStyle(color: Colors.black87),
                            asset: Image.asset(
                              "assets/images/logo.png",
                              package: "ui_mixins",
                            )));
                    await Future.delayed(const Duration(seconds: 3));
                    Navigator.pop(context);
                  },
                  child: const AnimatedWidgetTest()),
            )
          ],
        ),
    );
  }
}