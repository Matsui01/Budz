import 'package:flutter_bloc/flutter_bloc.dart';

class SingleSelectionCubit extends Cubit<String> {
  List<String> list;
  SingleSelectionCubit(String initialState, this.list) : super(initialState);

  void select(String text) => emit(text);
}
