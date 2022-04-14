
import 'package:bloc_eazy/export.dart';
import 'package:example/models/shared_bloc/shared_bloc_state.dart';

class SharedBloc extends Bloc {
  SharedBloc() {
    coordinator.controller.onListen = () {
      setState(SharedBlocState("rawValue"));
    };
  }
}