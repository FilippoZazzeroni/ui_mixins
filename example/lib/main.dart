import 'package:flutter/material.dart';
import 'package:ui_mixins/mixins/loadble/dialog_type.dart';
import 'package:ui_mixins/mixins/loadble/loadble.dart';
import 'package:ui_mixins/mixins/loadble/loading_data.dart';

void main() {
  runApp(const MaterialApp(home: MainView()));
}

class MainView extends StatelessWidget with Loadable {
  const MainView({Key? key}) : super(key: key);

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
                          type: DialogType.error,
                          text: "errore",
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
                child: const Text("loadable")),
          )
        ],
      ),
    );
  }
}
