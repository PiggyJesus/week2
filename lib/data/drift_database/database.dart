import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:week2/data/drift_database/todos.dart';

import '../../domain/entities/todo_entity.dart';

part 'database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}

@DriftDatabase(tables: [Todos])
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  Future<List<Todo>> get all => select(todos).get();

  Future<List<Todo>> getCompleted(bool isCompleted) {
    return (select(todos)..where((tbl) => tbl.isCompleted.equals(isCompleted)))
        .get();
  }

  Future<int> addTodoFromEntity(TodoEntity td)
  {
    return addTodo(TodosCompanion(
      taskName: Value(td.name),
      finishTime: Value(td.finishTime),
      isCompleted: Value(td.isCompleted),
    ));
  }

  Future<int> addTodo(TodosCompanion entry) {
    return into(todos).insert(entry);
  }

  Future<int> updateCompleted(int id, bool isCompleted) {
    return (update(todos)..where((td) => td.id.equals(id)))
        .write(TodosCompanion(isCompleted: Value(isCompleted)));
  }

  @override
  int get schemaVersion => 1;
}
