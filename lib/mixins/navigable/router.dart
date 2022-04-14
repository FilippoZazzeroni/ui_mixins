library ui_mixins;

import 'package:flutter/material.dart';

class NavigableRouter {
  NavigableRouter._internal();

  //

  static final instance = NavigableRouter._internal();

  Map<String, Widget Function(BuildContext)> _routes = {};

  Map<String, Widget Function(BuildContext)> get routes => _routes;

  //

  void setRoutes(Map<String, Widget Function(BuildContext)> namedRoutes) {
    _routes = namedRoutes;
  }

  Widget Function(BuildContext)? getRouteFunction(String route) {
    return _routes[route];
  }
}
