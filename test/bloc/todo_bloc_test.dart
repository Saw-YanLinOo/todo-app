import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/bloc/todo_bloc.dart';
import 'package:todo_app/data/models/todo_model.dart';

import '../data.model/todo_model_impl_mock.dart';
import '../mock_data/mock_data.dart';

void main() {
  group('Todo Bloc Test', () {
    late TodoBloc bloc;

    setUp(() {
      bloc = TodoBloc(todoModel: TodoModelImplMock());
    });

    test('Fetch Todo List Test', () {
      expect(bloc.todoList, getToDoMock());
    });
  });
}
