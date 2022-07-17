abstract class ListnameState{}

class ListnameInitialStates extends ListnameState{}
class ListnameLoadingStates extends ListnameState{}
class ListnameSuccessStates extends ListnameState{
  final List list;
  ListnameSuccessStates({required this.list});
}
class ListnameErrorStates extends ListnameState{
  
}