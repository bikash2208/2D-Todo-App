import 'package:flutter/cupertino.dart';

class TodoData {
  String todoTitle = "";
  TodoData(this.todoTitle);
}

class AddTask extends ChangeNotifier {
  List<TodoData> todoList = [];

  addTask(String s) {
    TodoData item = TodoData(s);

    todoList.add(item);
    notifyListeners();
  }
}
