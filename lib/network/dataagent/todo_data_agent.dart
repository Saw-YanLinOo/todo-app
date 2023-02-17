import 'package:todo_app/data/vos/todo_vo.dart';

abstract class ToDoDataAgent {
  Stream<List<TodoVo>> getToDo();
  Future addTodo(TodoVo todo);
}
