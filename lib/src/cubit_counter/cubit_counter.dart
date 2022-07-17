import 'package:cubitexemple/src/cubit_counter/state_counter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitialState());

  int counter = 0;

  incrementCounter() async {
    try {emit(CounterLoadingState());
await Future.delayed(const Duration(milliseconds: 500));
counter = counter +1;
emit(CounterSuccessState(couunter: counter));
} catch (e) {
  emit(CounterErrorState());
 

}
  }

  decrementCounter() async {
      try {emit(CounterLoadingState());
await Future.delayed(const Duration(milliseconds: 500));
counter = counter -1;
emit(CounterSuccessState(couunter: counter));
} catch (e) {
  emit(CounterErrorState());
 

}
  }
}
