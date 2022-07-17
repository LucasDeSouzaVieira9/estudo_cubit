
abstract class CounterState{
  CounterState();
}

class CounterInitialState extends CounterState{


}

class CounterLoadingState extends CounterState{


}

class CounterSuccessState extends CounterState{
int couunter;

CounterSuccessState({required this.couunter});

}

class CounterErrorState extends CounterState{


}

