import 'package:example/ui/views/loadble_view.dart';
import 'package:example/ui/views/route_view/route_scopes_test.dart';
import 'package:example/ui/views/route_view/route_view.dart';
import 'package:flutter/material.dart';
import 'package:ui_mixins/export.dart';

void main() {
  runApp(const _App());
}


class _App extends StatelessWidget {
  const _App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    _setRoutesForScopes();

    return MaterialApp(
      routes: NavigableRouter.instance.routes,
      home: const RouteView(),
    );
  }

  void _setRoutesForScopes() {

    NavigableRouter.instance.setRoutes({
      "/loadble_view": const LoadableView(),
      "/route_view": const RouteView(),
    }, RouteScopeTest1());

    NavigableRouter.instance.setRoutes({
      "/loadble_view": const LoadableView(),
      "/route_view2": const RouteView2(),
    }, RouteScopeTest2());
  }

}




