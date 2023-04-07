part of 'todos_bloc.dart';

class TodosEvent {}

class TodosGetEvent extends TodosEvent {}

class TodosInsertEvent extends TodosEvent {
  TodoEntity todo;

  TodosInsertEvent(this.todo);
}

class TodosUpdateEvent extends TodosEvent {
  int id;
  bool isCompleted;

  TodosUpdateEvent(this.isCompleted, this.id);
}

class TodosSortEvent extends TodosEvent {
  SortTypes? sortType;

  TodosSortEvent({this.sortType});
}