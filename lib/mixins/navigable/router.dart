
import 'package:flutter/cupertino.dart';
import 'package:ui_mixins/mixins/navigable/navigable_exception.dart';
import 'package:ui_mixins/mixins/navigable/route_scope.dart';

class NavigableRouter {

  NavigableRouter._internal();

  //

  static final instance = NavigableRouter._internal();

  final Map<String, Map<String, Widget>> _routes = {};

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
    _routes[scope.rawValue] = namedRoutes;
  }

  Map<String, Widget> getScopedRoutes(NavigableRouteScope scope) {
    final scopedRoutes = _routes[scope.rawValue];
    if (scopedRoutes != null) {
      return scopedRoutes;
    }
    throw NavigableException("NO_ROUTES_FOUND_FOR_THE_PASSED_SCOPE", "No routes found for the selected scope. Remember to set the route for the passed scope during app initialization via the NavigableRouter.instance.setRoute()");
  }
}