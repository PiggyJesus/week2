import '../entities/todo_entity.dart';


abstract class TodosRepository {
  Future<List<TodoEntity>> getCompleted(bool isCompleted);
  Future<void> addTodo(TodoEntity todo);
  Future<void> updateCompleted(TodoEntity todo);
}