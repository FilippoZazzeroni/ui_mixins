

import 'package:bloc_eazy/export.dart';
import 'package:example/models/shared_bloc/shared_bloc.dart';
import 'package:example/models/shared_bloc/shared_bloc_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ui_mixins/export.dart';

class RouteView extends StatelessWidget with Navigable {
  const RouteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: BlocBuilder<SharedBloc, SharedBlocState>(
        builder: (context, snapshot) {

          if (kDebugMode) {
            print(snapshot.data);
          }

          return Column(

            children: [
              TextButton(onPressed: () {
                pushNamedRoute(context, route: "/loadble_view");
              }, child: const Text("Go to loadble view")),
              TextButton(onPressed: () {
                pushNamedRoute(context, route: "/");
              }, child: const Text("Go to route view")),
              TextButton(onPressed: () {
                pushNamedRoute(context, route: "/animated_view");
              }, child: const Text("Go to animated view")),
            ],
          );
        }
      ),
    ));
  }
}

class RouteView2 extends StatelessWidget with Navigable {
  const RouteView2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: BlocBuilder<SharedBloc, SharedBlocState>(
        builder: (context, snapshot) {

          if (kDebugMode) {
            print(snapshot.data);
          }

          return Column(

            children: [
              TextButton(onPressed: () {
                pushNamedRoute(context, route: "/");
              }, child: const Text("You are in the Route View 2 Screen")),
            ],
          );
        }
      ),
    ));
  }
}
