import 'package:example/models/shared_bloc/shared_bloc.dart';
import 'package:example/models/shared_bloc/shared_bloc_state.dart';
import 'package:example/ui/views/animated_view.dart';
import 'package:example/ui/views/loadble_view.dart';
import 'package:example/ui/views/route_view.dart';
import 'package:flutter/material.dart';
import 'package:ui_mixins/export.dart';
import 'package:bloc_eazy/export.dart';

void main() {
  BlocProvider().create(SharedBloc(SharedBlocState("initial")));
  runApp(const _App());
}


class _App extends StatelessWidget {
  const _App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    _setRoutes();

    return MaterialApp(
      routes: NavigableRouter.instance.routes,
      initialRoute: "/",
    );
  }

  void _setRoutes() {

    NavigableRouter.instance.setRoutes({
      "/": (context) => const RouteView(),
      "/loadble_view": (context) => const LoadableView(),
      "/animated_view": (context) => const AnimatedView(),
    });
  }

}




