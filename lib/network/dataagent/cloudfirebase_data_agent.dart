import 'package:todo_app/data/vos/todo_vo.dart';
import 'package:todo_app/network/dataagent/todo_data_agent.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

const String todoPath = 'todo';

class CloudfirebaseDataAgentImpl extends ToDoDataAgent {
  CloudfirebaseDataAgentImpl.singleton();
  static final CloudfirebaseDataAgentImpl _singleton =
      CloudfirebaseDataAgentImpl.singleton();
  factory CloudfirebaseDataAgentImpl() => _singleton;

  final cloudfirestore = FirebaseFirestore.instance;

  @override
  Stream<List<TodoVo>> getToDo() {
    return cloudfirestore.collection(todoPath).snapshots().map((querySnapshot) {
      return querySnapshot.docs.map<TodoVo>((document) {
        return TodoVo.fromJson(document.data());
      }).toList();
    });
  }

  @override
  Future addTodo(TodoVo todo) {
    return cloudfirestore.collection(todoPath).doc(todo.id).set(todo.toJson());
  }
}
