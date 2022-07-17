import 'package:cubitexemple/src/cubit_counter/cubit_counter.dart';
import 'package:cubitexemple/src/cubit_counter/state_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterView extends StatelessWidget {
  CounterView({Key? key}) : super(key: key);

  final CounterCubit cubit = CounterCubit();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            BlocConsumer<CounterCubit, CounterState>(
                bloc: cubit,
                listener: (contex, state) {},
                builder: (contex, state) {
                  if (state is CounterLoadingState) {
                    return const CircularProgressIndicator();
                  } else if (state is CounterSuccessState) {
                    return Text('${cubit.counter}');
                  }
                  return const Text('data');
                }),
            ElevatedButton(
                onPressed: () {
                  cubit.incrementCounter();
                },
                child: const Text('+')),
            ElevatedButton(
                onPressed: () {
                  cubit.decrementCounter();
                },
                child: const Text('-')),
          ],
        ),
      ),
    );
  }
}
