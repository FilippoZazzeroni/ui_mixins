import 'package:flutter/material.dart';
import 'package:ui_mixins/mixins/loadble/dialog_type.dart';
import 'package:ui_mixins/mixins/loadble/loadble.dart';
import 'package:ui_mixins/mixins/loading_data.dart';

void main() {
  runApp(MaterialApp(home: MainView()));
}

class MainView extends StatelessWidget with Loadable {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextButton(
              onPressed: () async {
                showLoadingDialog(
                    context,
                    LoadingData(
                        type: DialogType.loading,
                        style: const TextStyle(color: Colors.black87),
                        asset: Image.asset(
                          "assets/images/logo.png",
                          package: "ui_mixins",
                        )));

                await Future.delayed(const Duration(seconds: 3));
                Navigator.pop(context);
                showLoadingDialog(
                    context,
                    LoadingData(
                        type: DialogType.success,
                        style: const TextStyle(color: Colors.black87),
                        asset: Image.asset(
                          "assets/images/logo.png",
                          package: "ui_mixins",
                        )));
                await Future.delayed(const Duration(seconds: 3));
                Navigator.pop(context);
              },
              child: const Text("loadable"))
        ],
      ),
    );
  }
}
