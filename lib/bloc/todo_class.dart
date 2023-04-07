import 'package:week2/database/database.dart';

class TodoClass {
  late String name;
  late DateTime createTime;
  late bool isCompleted;
  int? id;

  TodoClass({
    required this.name,
    required this.createTime,
    this.isCompleted = false,
    this.id,
  });

  TodoClass.fromTodo(Todo todo) {
    name = todo.taskName;
    createTime = todo.createTime;
    isCompleted = todo.isCompleted;
    id = todo.id;
  }

  TodoClass copyWith({
    int? id,
    String? name,
    DateTime? createTime,
    bool? isCompleted,
  }) {
    return TodoClass(
      id: id ?? this.id,
      name: name ?? this.name,
      createTime: createTime ?? this.createTime,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  String toString() {
    return '$id: $name $createTime $isCompleted';
  }
}
