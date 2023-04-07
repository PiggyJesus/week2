import '../../domain/entities/todo_entity.dart';
import '../drift_database/database.dart';

abstract class Mapper {
  static TodoEntity todoToTodoEntity(Todo todo) {
    return TodoEntity(
      name: todo.taskName,
      finishTime: todo.finishTime,
      isCompleted: todo.isCompleted,
      id: todo.id,
    );
  }
}
