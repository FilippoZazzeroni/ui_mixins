import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _createHeaderView(context, children: createChildren());
  }

  List<Widget> createChildren() {
    return [
      const CircularProgressIndicator(),
      createLoadingText("Loading ...",
          style: const TextStyle(color: Colors.black))
    ];
  }
  Widget createLoadingText(String text, {required TextStyle style}) {
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

  Widget _createHeaderView(BuildContext context,
      {required List<Widget> children}) {
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
    ]));
  }
}
