import 'package:bloc/bloc.dart';

part 'viewflowers_state.dart';

class ViewFlowersCubit extends Cubit<ViewFlowersState> {
  ViewFlowersCubit(): super(ViewFlowersState(counterValue:1));

  void increment() =>
      emit(ViewFlowersState(counterValue: state.counterValue + 1, wasIncremented: true));

  void decrement() => emit(
      ViewFlowersState(counterValue: state.counterValue > 1?  - 1 : 0, wasIncremented: false));
}
