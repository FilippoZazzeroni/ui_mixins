
import 'package:flutter/cupertino.dart';
import 'package:ui_mixins/mixins/navigable/route_scope.dart';

class NavigableRouter {

  NavigableRouter._internal();

  //

  static final instance = NavigableRouter._internal();

  final Map<NavigableRouteScope, Map<String, Widget>> _routes = {};

  Map<String,Widget Function(BuildContext)> get routes {
    final dataToReturn = <String, Widget Function(BuildContext)>{};
    _routes.forEach((key, value) {
      final mappedBuildFunctions = value.map((key, value) => MapEntry(key, (BuildContext context) => value));
      dataToReturn.addAll(mappedBuildFunctions);
    });
    return dataToReturn;
  }

  //

  void setRoutes(Map<String, Widget> namedRoutes, NavigableRouteScope scope) {
    _routes[scope] = namedRoutes;
  }

  Map<String, Widget>? getScopedRoutes(NavigableRouteScope scope) => _routes[scope];
}