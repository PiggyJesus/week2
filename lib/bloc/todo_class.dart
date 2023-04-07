import 'package:week2/database/database.dart';

class TodoClass {
  late String name;
  late DateTime finishTime;
  late bool isCompleted;
  int? id;

  TodoClass({
    required this.name,
    required this.finishTime,
    this.isCompleted = false,
    this.id,
  });

  TodoClass.fromTodo(Todo todo) {
    name = todo.taskName;
    finishTime = todo.finishTime;
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
      finishTime: createTime ?? this.finishTime,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  String toString() {
    return '$id: $name $finishTime $isCompleted';
  }
}
