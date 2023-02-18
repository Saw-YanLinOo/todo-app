import 'package:todo_app/data/models/todo_model.dart';
import 'package:todo_app/data/vos/todo_vo.dart';

import '../mock_data/mock_data.dart';

class TodoModelImplMock extends TodoModel {
  @override
  Future addTodo(String todo) {
    return Future(() {
      getToDoMock().add(TodoVo(description: todo));
    });
  }

  @override
  Stream<List<TodoVo>> getTodo() {
    return Stream.value(getToDoMock());
  }
}
