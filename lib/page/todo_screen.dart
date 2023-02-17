import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/bloc/todo_bloc.dart';
import 'package:todo_app/data/vos/todo_vo.dart';

class ToDoScreen extends StatelessWidget {
  const ToDoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return ChangeNotifierProvider(
      create: (context) => TodoBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ToDo List'),
        ),
        body: Column(
          children: [
            DescriptionSection(controller: controller),
            const SizedBox(
              height: 10,
            ),
            Selector<TodoBloc, List<TodoVo>>(
                selector: (context, bloc) => bloc.todoList,
                builder: (context, todoList, child) {
                  return Expanded(
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: todoList.length,
                        itemBuilder: (context, index) {
                          var todo = todoList[index];

                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Text(todo.description ?? ''),
                            ),
                          );
                        }),
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoBloc>(builder: (context, bloc, child) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'Enter ToDo',
                  labelText: 'ToDo',
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            ElevatedButton(
              onPressed: () {
                bloc
                    .addTodo(controller.text)
                    .whenComplete(() => controller.clear())
                    .onError((error, stackTrace) {});
              },
              child: const Text('Add'),
            ),
          ],
        ),
      );
    });
  }
}
