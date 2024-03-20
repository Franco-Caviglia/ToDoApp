import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp_1/data/database.dart';
import 'package:myapp_1/util/dialog_box.dart';
import 'package:myapp_1/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //reference the hive box;
  final _myBox = Hive.box('mybox');

  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    //if this is the 1st time, then create default data;
    if (_myBox.get('TODOLIST') == null) {
      db.createInitialData();
    } else {
      //already exists data;
      db.localData();
    }

    super.initState();
  }

  //text controller;
  final _controller = TextEditingController();

  //checkbox was tapped;
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDatabase();
  }

  //save new task;
  void saveNewTask() {
    setState(() {
      //Add input to list;
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  //delete task;
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDatabase();
  }

  //create task;
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: (() => Navigator.of(context).pop()),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[200],
      appBar: AppBar(
        title: Center(
          child: Text(
            'TO DO',
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.green[600],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
              taskName: db.toDoList[index][0],
              taskCompleted: db.toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteFunction: (context) => deleteTask(index));
        },
      ),
    );
  }
}
