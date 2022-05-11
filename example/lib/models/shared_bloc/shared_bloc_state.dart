
import 'package:bloc_eazy/export.dart';

class SharedBlocState extends BlocState {

  SharedBlocState(String rawValue, {this.helperState = HelperState.initial}) : super(rawValue);

  final HelperState helperState;

}

enum HelperState {
  initial,
  loading,
  error,
  success
}