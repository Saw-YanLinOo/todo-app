import 'package:flutter/material.dart';
import 'package:todo_app/data/models/todo_model.dart';
import 'package:todo_app/data/models/todo_model_impl.dart';
import 'package:todo_app/data/vos/todo_vo.dart';

class TodoBloc extends ChangeNotifier {
  //State
  List<TodoVo> todoList = [];

  //Model
  TodoModel _todoModel = TodoModelImpl();

  TodoBloc() {
    _todoModel.getTodo().listen((event) {
      todoList = event;
      notifyListeners();
    });
  }

  Future addTodo(String desc) {
    if (desc.isEmpty) {
      return Future.error('Enter description');
    } else {
      return _todoModel.addTodo(desc);
    }
  }
}
