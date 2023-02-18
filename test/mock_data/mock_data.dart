import 'package:todo_app/data/vos/todo_vo.dart';

List<TodoVo> getToDoMock() => [
      TodoVo(
        id: '12345678',
        description: 'Wake up',
      ),
      TodoVo(
        id: 'asdfgjkl;',
        description: 'Take a washer',
        dateTime: null,
      ),
      TodoVo(
        id: 'qwertyui',
        description: 'Go to school',
        dateTime: null,
      ),
    ];
