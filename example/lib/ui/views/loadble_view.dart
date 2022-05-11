
import 'package:bloc_eazy/bloc/bloc_builder.dart';
import 'package:bloc_eazy/export.dart';
import 'package:example/models/shared_bloc/shared_bloc.dart';
import 'package:example/models/shared_bloc/shared_bloc_state.dart';
import 'package:example/ui/common/animated_widget.dart';
import 'package:flutter/material.dart';
import 'package:ui_mixins/export.dart';

class LoadableView extends StatelessWidget with Loadable {
  const LoadableView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.greenAccent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _dialogResponseInFunctionOfBlocState(),
            TextButton(
                onPressed: () => Bloc.ofType<SharedBloc>().mockSuccessfulApiResponse(),
                child: const Text("Show success full api response")),
            TextButton(
                onPressed: () => Bloc.ofType<SharedBloc>().mockErrorApiResponse(),
                child: const Text("Show error api response"))
          ],
        ),
    );
  }

  Widget _dialogResponseInFunctionOfBlocState() {
    return BlocBuilder<SharedBloc, SharedBlocState>(builder: (context, snapshot) {

      final state = snapshot.data!.helperState;
      WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
        switch(state) {
          case HelperState.initial:
            break;
          case HelperState.loading:
            showLoadingDialog(
                context,
                LoadingData(
                  type: DialogType.loading,
                  text: "loading",
                  style: const TextStyle(color: Colors.black87),
                ));
            break;
          case HelperState.error:
            dismiss(context);
            await showLoadingDialog(
                context,
                LoadingData(
                  type: DialogType.error,
                  text: "error",
                  style: const TextStyle(color: Colors.black87),
                ));
            break;
          case HelperState.success:
            dismiss(context);
            await showLoadingDialog(
                context,
                LoadingData(
                  type: DialogType.success,
                  text: "success",
                  asset: Image.asset("assets/images/logo.png"),
                  style: const TextStyle(color: Colors.black87),
                ));
            break;
        }
      });
      return const SizedBox();
    });
  }

}