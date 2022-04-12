

import 'package:example/ui/views/route_view/route_scopes_test.dart';
import 'package:flutter/material.dart';
import 'package:ui_mixins/export.dart';

class RouteView extends StatelessWidget with Navigable {
  const RouteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: Column(

        children: [
          TextButton(onPressed: () {
            pushNamedRoute(context, route: "/loadble_view", scope: RouteScopeTest1());
          }, child: const Text("Go to loadble view")),
          TextButton(onPressed: () {
            pushNamedRoute(context, route: "/route_view", scope: RouteScopeTest1());
          }, child: const Text("Go to route view")),
          TextButton(onPressed: () {
            pushNamedRoute(context, route: "/loadble_view", scope: RouteScopeTest2());
          }, child: const Text("Go to loadble view")),
          TextButton(onPressed: () {
            pushNamedRoute(context, route: "/route_view2", scope: RouteScopeTest2());
          }, child: const Text("Go to route view"))
        ],
      ),
    ));
  }
}

class RouteView2 extends StatelessWidget with Navigable {
  const RouteView2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: Column(

        children: [
          TextButton(onPressed: () {
            pushNamedRoute(context, route: "/route_view", scope: RouteScopeTest1());
          }, child: const Text("You are in the Route View 2 Screen")),
        ],
      ),
    ));
  }
}
