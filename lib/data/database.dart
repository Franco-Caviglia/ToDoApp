import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];

  //reference the box;
  final _myBox = Hive.box('mybox');
  //run this method if this is the 1st timer ever opening this app;
  void createInitialData() {
    toDoList = [
      ['Make tutorial', false],
      ['Do excercise', false],
    ];
  }

  //load the data from db;
  void localData() {
    toDoList = _myBox.get('TODOLIST');
  }

  //update the db;
  void updateDatabase() {
    _myBox.put('TODOLIST', toDoList);
  }
}
