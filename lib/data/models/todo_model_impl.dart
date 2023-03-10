import 'package:todo_app/data/models/todo_model.dart';
import 'package:todo_app/data/vos/todo_vo.dart';
import 'package:todo_app/network/dataagent/supabase_data_agent_impl.dart';
import 'package:todo_app/network/dataagent/todo_data_agent.dart';
import 'package:uuid/uuid.dart';

class TodoModelImpl extends TodoModel {
  TodoModelImpl.singleton();
  static final TodoModelImpl _singleton = TodoModelImpl.singleton();
  factory TodoModelImpl() => _singleton;

  // Data Agent
  // final ToDoDataAgent dataAgent = CloudfirebaseDataAgentImpl();
  late ToDoDataAgent dataAgent = SupabaseDataAgentImpl();

  //For testing
  void setDataAgent(ToDoDataAgent toDoDataAgent) {
    dataAgent = toDoDataAgent;
  }

  @override
  Stream<List<TodoVo>> getTodo() {
    return dataAgent.getToDo();
  }

  @override
  Future addTodo(String desc) {
    // TODO: implement addTodo
    return crafTodoVo(desc).then(
      (value) => dataAgent.addTodo(value),
    );
  }

  Future<TodoVo> crafTodoVo(String desc) {
    var todo = TodoVo(
      id: Uuid().v4(),
      description: desc,
      dateTime: DateTime.now(),
    );
    return Future.value(todo);
  }
}
