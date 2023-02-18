import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_app/data/vos/todo_vo.dart';
import 'package:todo_app/network/dataagent/todo_data_agent.dart';

const String todoTable = 'todo';

class SupabaseDataAgentImpl extends ToDoDataAgent {
  SupabaseDataAgentImpl.singleton();
  static final SupabaseDataAgentImpl _singleton =
      SupabaseDataAgentImpl.singleton();
  factory SupabaseDataAgentImpl() => _singleton;

  final supabase = Supabase.instance.client;

  @override
  Future addTodo(TodoVo todo) {
    return supabase.from(todoTable).insert(todo.toJson());
  }

  @override
  Stream<List<TodoVo>> getToDo() {
    return supabase.from(todoTable).stream(primaryKey: ["id"]).map((todoList) {
      return todoList.map((e) => TodoVo.fromJson(e)).toList();
    });
  }
}
