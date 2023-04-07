import 'package:week2/data/drift_database/database.dart';

class TodoEntity {
  late String name;
  late DateTime finishTime;
  late bool isCompleted;
  int? id;

  TodoEntity({
    required this.name,
    required this.finishTime,
    this.isCompleted = false,
    this.id,
  });

  TodoEntity.fromTodo(Todo todo) {
    name = todo.taskName;
    finishTime = todo.finishTime;
    isCompleted = todo.isCompleted;
    id = todo.id;
  }

  TodoEntity copyWith({
    int? id,
    String? name,
    DateTime? createTime,
    bool? isCompleted,
  }) {
    return TodoEntity(
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
