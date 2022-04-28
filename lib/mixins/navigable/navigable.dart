
library ui_mixins;

import 'package:flutter/material.dart';
import 'package:ui_mixins/mixins/navigable/router.dart';

mixin Navigable {

  void push(BuildContext context,  {required Widget page}) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return page;
    }));
  }

  void pushNamedRoute(BuildContext context, {required String route}) {

    final routeFunction = NavigableRouter.instance.getRouteFunction(route);

    if (routeFunction != null) {
      Navigator.pushNamed(context, route);
    } else {
      throw FlutterError("The route passed is not existing. Remember to set the routes via the NavigableRouter.instance.setRoute() and to pass them into the MaterialApp with NavigableRouter.instance.routes");
    }
  }

  void pushNamedRouteOnTopAndReplaceAllRoute(BuildContext context, {required String route}) {
    final routeFunction = NavigableRouter.instance.getRouteFunction(route);

    if (routeFunction != null) {
      Navigator.pushReplacementNamed(context, route);
    } else {
      throw FlutterError("The route passed is not existing. Remember to set the routes via the NavigableRouter.instance.setRoute() and to pass them into the MaterialApp with NavigableRouter.instance.routes");
    }
  }

  void pop(BuildContext context) {
    Navigator.pop(context);
  }
}