import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_mixins/mixins/navigable.dart';

void main() {
  testWidgets(
    "navigate forword three screens and navigate back in order",
    (widgetTester) async {
      const app = MaterialApp(
        home: ScreenOne(),
      );
      //validate screen one is mounted
      await widgetTester.pumpWidget(app);
      await widgetTester.pumpAndSettle();
      final screenOneTitle = find.text("screen one");
      expect(screenOneTitle, findsWidgets);

      //navigate to  next screen
      await widgetTester.tap(find.byKey(const Key("screen_one_next_button")));
      await widgetTester.pumpAndSettle();

      //validate screen two is mounted
      final screenTwoTitle = find.text("screen two");
      expect(screenTwoTitle, findsWidgets);

      //navigate to  next screen
      await widgetTester.tap(find.byKey(const Key("screen_two_next_button")));
      await widgetTester.pumpAndSettle();

      //validate screen three is mounted
      final screenThreeTitle = find.text("screen three");
      expect(screenThreeTitle, findsWidgets);

      //navigate to previous screen
      await widgetTester.tap(find.byKey(const Key("screen_three_back_button")));
      await widgetTester.pumpAndSettle();

      //validate screen two is mounted
      final screenTwoTitleBack = find.text("screen two");
      expect(screenTwoTitleBack, findsWidgets);
      //navigate to previous screen
      await widgetTester.tap(find.byKey(const Key("screen_two_back_button")));
      await widgetTester.pumpAndSettle();

      //validate screen one is mounted
      final screenOneTitleBack = find.text("screen one");
      expect(screenOneTitleBack, findsWidgets);
    },
  );
}

class ScreenOne extends StatelessWidget with Navigable {
  const ScreenOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("screen one"),
        ElevatedButton(
            key: const Key("screen_one_next_button"),
            onPressed: () {
              push(context, page: const ScreenTwo());
            },
            child: const Text("go to screen two"))
      ],
    );
  }
}

class ScreenTwo extends StatelessWidget with Navigable {
  const ScreenTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("screen two"),
        ElevatedButton(
            key: const Key("screen_two_next_button"),
            onPressed: () {
              push(context, page: const ScreenThree());
            },
            child: const Text("go to screen three")),
        ElevatedButton(
            key: const Key("screen_two_back_button"),
            onPressed: () {
              pop(context);
            },
            child: const Text("go back"))
      ],
    );
  }
}

class ScreenThree extends StatelessWidget with Navigable {
  const ScreenThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("screen three"),
        ElevatedButton(
            key: const Key("screen_three_back_button"),
            onPressed: () {
              pop(context);
            },
            child: const Text("go back"))
      ],
    );
  }
}
