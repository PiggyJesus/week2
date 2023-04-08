import 'package:week2/data/drift_database/database.dart';
import 'package:week2/data/mapper/mapper.dart';
import 'package:week2/domain/entities/todo_entity.dart';
import 'package:week2/domain/repository/todos_repository.dart';

class TodosDataRepository extends TodosRepository {
  AppDb appDb = AppDb();


  @override
  Future<int> addTodo(TodoEntity todo) {
    return appDb.addTodoFromEntity(todo);
  }

  @override
  Future<List<TodoEntity>> getCompleted(bool isCompleted) async {
    return (await appDb.getCompleted(isCompleted))
        .map((e) => Mapper.todoToTodoEntity(e))
        .toList();
  }

  @override
  Future<int> updateCompleted(int id, bool isCompleted) {
    return appDb.updateCompleted(id, isCompleted);

  }

}