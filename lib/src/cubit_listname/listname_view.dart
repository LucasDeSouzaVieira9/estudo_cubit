import 'package:cubitexemple/src/cubit_listname/listname_cubit.dart';
import 'package:cubitexemple/src/cubit_listname/listname_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListnameView extends StatelessWidget {
  ListnameView({Key? key}) : super(key: key);

  final TextEditingController addNameController = TextEditingController();
  final ListnameCubit cubit = ListnameCubit();

  @override
  Widget build(BuildContext context) {
    print ('aaaaaaaa');
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: addNameController,
              decoration: const InputDecoration(filled: true),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 2 - 10,
                    child: ElevatedButton(
                        onPressed: () {
                          if (addNameController.text.isNotEmpty) {
                            cubit.addName(
                                addNameController.text);
                          }
                        },
                        child: const Text('ADD'))),
                SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 2 - 10,
                    child: ElevatedButton(
                        onPressed: () {
                          cubit.removeName();
                        },
                        child: const Text('REMOVE'))),
              ],
            ),
            const SizedBox(height: 15),
            BlocConsumer<ListnameCubit, ListnameState>(
                bloc: cubit,
                builder: (context, state) {
                  if (state is ListnameLoadingStates) {
                    return const SizedBox(
                      width: 48,
                      height: 48,
                      child: CircularProgressIndicator(),
                    );
                  } else  {
                    return Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) =>
                            Center(child: Text(cubit.listname[index],style: const TextStyle(fontSize: 30),)),
                        itemCount: cubit.listname.length,
                      ),
                    );
                  }
                  
                },
                listener: (contex, state) {
                  if (state is ListnameErrorStates) {
                    final String erro = cubit.listname.isNotEmpty
                        ? 'Erro!! Limite maximo de 10!'
                        : 'Erro!! Nenhum Item na lista!';
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        duration: const Duration(milliseconds: 1000),
                        content: Text(erro)));
                  }
                }),
          ],
        ),
      ),
    ));
  }
}
