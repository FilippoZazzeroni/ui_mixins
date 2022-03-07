import 'package:flutter/material.dart';
import 'package:ui_mixins/mixins/loadble/dialog_type.dart';
import 'package:ui_mixins/mixins/loadble/loadble.dart';
import 'package:ui_mixins/mixins/loadble/loading_data.dart';
import 'package:ui_mixins/mixins/sizeble.dart';
import 'package:ui_mixins/mixins/transitionable.dart';

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
                child: AnimatedWidget()),
          )
        ],
      ),
    );
  }
}

class AnimatedWidget extends StatefulWidget {
  const AnimatedWidget({Key? key}) : super(key: key);

  @override
  State<AnimatedWidget> createState() => _AnimatedWidgetState();
}

class _AnimatedWidgetState extends State<AnimatedWidget>
    with TickerProviderStateMixin, Transitionable, Sizeable {
  late AnimationController _controller;

  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..forward();
    _animation = Tween<double>(begin: 1, end: 60).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInCubic,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return transitionBuilder(
        context,
        _animation,
        Container(
            color: Colors.red, width: width(context), height: height(context)));
  }
}
