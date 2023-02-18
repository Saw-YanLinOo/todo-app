import 'dart:async';

import 'package:todo_app/data/vos/todo_vo.dart';
import 'package:todo_app/network/dataagent/todo_data_agent.dart';

import '../mock_data/mock_data.dart';

class ToDoDataAgentImplMock extends ToDoDataAgent {
  @override
  Future addTodo(TodoVo todo) {
    return Future.value('success');
  }

  @override
  Stream<List<TodoVo>> getToDo() {
    return Stream.value(getToDoMock());
  }
}
