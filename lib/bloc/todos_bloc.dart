
import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart';
import 'package:week2/bloc/todo_class.dart';
import 'package:week2/main.dart';

import '../database/database.dart';

part 'todos_event.dart';

part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  List<TodoClass> completed = [];
  List<TodoClass> notCompleted = [];

  TodosBloc() : super(TodosInitState()) {
    on<TodosGetEvent>(_get);
    on<TodosInsertEvent>(_insert);
    on<TodosUpdateEvent>(_update);
  }

  void _get(TodosGetEvent event, Emitter<TodosState> emit) async {
    emit(TodosLoadingState());

    completed = (await appDb.getCompleted(true))
        .map((e) => TodoClass.fromTodo(e))
        .toList();
    notCompleted = (await appDb.getCompleted(false))
        .map((e) => TodoClass.fromTodo(e))
        .toList();
    emit(TodosLoadedState());
  }

  void _insert(TodosInsertEvent event, Emitter<TodosState> emit) async {
    await appDb.addTodo(TodosCompanion(
      taskName: Value(event.todo.name),
      createTime: Value(event.todo.createTime),
      isCompleted: Value(event.todo.isCompleted),
    ));
    add(TodosGetEvent());
  }

  void _update(TodosUpdateEvent event, Emitter<TodosState> emit) {
    emit(TodosLoadingState());

    appDb.updateCompleted(event.id, event.isCompleted);

    if (event.isCompleted) {
      final removed = notCompleted
          .where((e) => (e.id == event.id))
          .map((e) => e.copyWith(isCompleted: true))
          .toList();
      print(removed);
      notCompleted.removeWhere((e) => (e.id == event.id));
      completed.addAll(removed);
    } else {
      final removed = completed
          .where((e) => (e.id == event.id))
          .map((e) => e.copyWith(isCompleted: false))
          .toList();
      print(removed);
      completed.removeWhere((e) => (e.id == event.id));
      notCompleted.addAll(removed);
    }

    print(notCompleted);
    print(completed);
    emit(TodosLoadedState());
  }
}
