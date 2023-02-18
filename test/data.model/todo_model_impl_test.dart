import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/data/models/todo_model_impl.dart';

import '../mock_data/mock_data.dart';
import '../network/todo_data_agent_impl_mock.dart';

void main() async {
  group('Todo Model Test', () {
    var todoModel = TodoModelImpl();

    setUp(() {
      todoModel.setDataAgent(ToDoDataAgentImplMock());
    });

    test('Get Todo List Test', () {
      expect(
        todoModel.getTodo(),
        emits(getToDoMock()),
      );
    });

    test('Add Todo Test', () {
      expect(
        todoModel.addTodo('Hello'),
        completion(
          equals('success'),
        ),
      );
    });
  });
}
