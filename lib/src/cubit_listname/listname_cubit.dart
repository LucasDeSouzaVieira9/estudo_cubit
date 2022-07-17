import 'package:cubitexemple/src/cubit_listname/listname_state.dart';
import 'package:cubitexemple/src/cubit_listname/repositorio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListnameCubit extends Cubit<ListnameState> {
  ListnameCubit() : super(ListnameInitialStates());

  Repository repository = Repository();
  List<String> listname = [];

  addName(String name) async{
   
    if (listname.length <=9) {
   
      emit(ListnameLoadingStates());
      await repository.add(name);
      listname = repository.load();
      emit(ListnameSuccessStates(list: listname));
    } else {
      emit(ListnameErrorStates());
    }
  }

  removeName() async{
   
    if (listname.isNotEmpty) {
      
      emit(ListnameLoadingStates());
      await repository.remove();
      listname = repository.load();
      emit(ListnameSuccessStates(list: listname));
    } else {
      emit(ListnameErrorStates());
    }
  }
}
