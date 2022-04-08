
library ui_mixins;

import 'package:flutter/material.dart';
import 'package:ui_mixins/mixins/navigable/navigable_exception.dart';
import 'package:ui_mixins/mixins/navigable/route_scope.dart';
import 'package:ui_mixins/mixins/navigable/router.dart';

mixin Navigable {

  void push(BuildContext context,  {required Widget page}) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return page;
    }));
  }

  void pushNamedRoute(BuildContext context, {required String route, required NavigableRouteScope scope}) {

    final routesScope = NavigableRouter.instance.getScopedRoutes(scope);

    if (routesScope[route] != null) {
      Navigator.pushNamed(context, route);
    } else {
      throw NavigableException("NO_ROUTE_EXISTING", "The route passed is not existing. Remember to set the routes via the NavigableRouter.instance.setRoute() and to pass them into the MaterialApp with NavigableRouter.instance.routes");
    }

  }

  void pop(BuildContext context) {
    Navigator.pop(context);
  }
}