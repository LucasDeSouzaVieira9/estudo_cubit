class Repository{

  List<String> listName = [];

  
  add(String name)async{
    if(listName.length <=9){
      await Future.delayed(const Duration(milliseconds: 500));
    listName.add(name);
    }
    

  }
  remove()async{

    await Future.delayed(const Duration(milliseconds: 500));
    listName.removeLast();

  }


  List<String> load(){
return listName;
  }
}