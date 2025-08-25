import 'package:flutter_bloc/flutter_bloc.dart';


abstract class CubitCustom<State> extends Cubit<State> {
  CubitCustom(super.initialState);

  State get currentState => state;

  @override
  void emit(State state) {
    if (isClosed) return;
    super.emit(state);
  }



}
