import '../entities/todo_entity.dart';


abstract class TodosRepository {
  Future<List<TodoEntity>> getCompleted(bool isCompleted);
  Future<int> addTodo(TodoEntity todo);
  Future<int> updateCompleted(int id, bool isCompleted);
}