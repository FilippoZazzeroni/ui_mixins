
import 'package:bloc_eazy/export.dart';
import 'package:example/models/shared_bloc/shared_bloc_state.dart';

class SharedBloc extends Bloc<SharedBlocState> {

  SharedBloc(SharedBlocState initialState) : super(initialState);

  void mockSuccessfulApiResponse() async {
    setState(SharedBlocState("loading", helperState: HelperState.loading));
    await Future.delayed(const Duration(seconds: 2));
    setState(SharedBlocState("success", helperState: HelperState.success));
  }

  void mockErrorApiResponse() async {
    setState(SharedBlocState("loading", helperState: HelperState.loading));
    await Future.delayed(const Duration(seconds: 2));
    setState(SharedBlocState("error", helperState: HelperState.error));
  }
}