
import 'package:flutter/cupertino.dart';

class NavigableRouter {

  NavigableRouter._internal();

  //

  static final instance = NavigableRouter._internal();

  Map<String,Widget Function(BuildContext)> _routes = {};

  Map<String,Widget Function(BuildContext)> get routes => _routes;

  //

  void setRoutes(Map<String, Widget> namedRoutes) {
    _routes = {};
    namedRoutes.forEach((key, value) {
      _routes[key] = (BuildContext context) => value;
    });
  }
}