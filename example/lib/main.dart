import 'package:example/models/shared_bloc/shared_bloc.dart';
import 'package:example/ui/views/loadble_view.dart';
import 'package:example/ui/views/route_view/route_view.dart';
import 'package:flutter/material.dart';
import 'package:ui_mixins/export.dart';
import 'package:bloc_eazy/export.dart';

void main() {
  BlocProvider().create(SharedBloc());
  runApp(const _App());
}


class _App extends StatelessWidget {
  const _App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    _setRoutesForScopes();

    return MaterialApp(
      routes: NavigableRouter.instance.routes,
      initialRoute: "/",
    );
  }

  void _setRoutesForScopes() {

    NavigableRouter.instance.setRoutes({
      "/": (context) => const RouteView(),
      "/route_view2": (context) => const RouteView(),
      "/loadble_view": (context) => const LoadableView(),
    });
  }

}




