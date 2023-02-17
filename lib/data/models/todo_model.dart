import 'package:todo_app/data/vos/todo_vo.dart';

abstract class TodoModel {
  Stream<List<TodoVo>> getTodo();
  Future addTodo(String todo);
}
