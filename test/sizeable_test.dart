import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ui_mixins/mixins/sizeble.dart';

void main() {
  testWidgets(
    "widget with sizable get height and width correctly ",
    (widgetTester) async {
      widgetTester.binding.window.physicalSizeTestValue = const Size(600, 1024);
      widgetTester.binding.window.devicePixelRatioTestValue = 1.0;
      const sut = MediaQuery(data: MediaQueryData(), child: SUT());

      await widgetTester.pumpWidget(sut);

      await widgetTester.pumpAndSettle();
      final finder = find.byKey(const Key("sut"));

      final size = widgetTester.getSize(finder);

      expect(size, equals(const Size(600, 1024)));
    },
  );
}

class SUT extends StatelessWidget with Sizeable {
  const SUT({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: const Key("sut"),
      height: height(context),
      width: width(context),
    );
  }
}
