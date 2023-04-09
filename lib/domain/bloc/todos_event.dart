part of 'todos_bloc.dart';

class TodosEvent {}

class TodosGetEvent extends TodosEvent {}

class TodosInsertEvent extends TodosEvent {
  TodoEntity todo;

  TodosInsertEvent(this.todo);
}

class TodosUpdateEvent extends TodosEvent {
  TodoEntity todo;

  TodosUpdateEvent(this.todo);
}

class TodosSortEvent extends TodosEvent {
  SortTypes? sortType;

  TodosSortEvent({this.sortType});
}