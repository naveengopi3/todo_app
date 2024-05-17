import 'package:hive_flutter/hive_flutter.dart';

class TodoDataBase{
List todoList = [];

final _myBox = Hive.box('mybox');


void loadData(){
 todoList =  _myBox.get("TODOLIST");
}

void update(){
  _myBox.put("TODOLIST", todoList);
}


}