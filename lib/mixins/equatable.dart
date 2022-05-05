
library ui_mixins;

import 'dart:math';

extension RandomInt on int {

  /// Generates random integer
  static int randomInt() {
    var randomNumber = Random();
    return randomNumber.nextInt(100000000000000000);
  }

}

abstract class Equatable {

  /// Checks equality between to classes.
  @override
  bool operator ==(Object other) {
    return assignEqualityExpression(other as Equatable);
  }

  bool assignEqualityExpression(Equatable other);

  @override
  int get hashCode => RandomInt.randomInt();
}


