

import 'package:flutter_bloc/flutter_bloc.dart';

extension BlocReset on Bloc {
  void emitState(dynamic initialState) {
    emit(initialState);
  }
}