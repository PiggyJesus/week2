part of 'todos_bloc.dart';

class TodosEvent {}

class TodosGetEvent extends TodosEvent {}

class TodosInsertEvent extends TodosEvent {
  TodoClass todo;

  TodosInsertEvent(this.todo);
}

class TodosUpdateEvent extends TodosEvent {
  int id;
  bool isCompleted;

  TodosUpdateEvent(this.isCompleted, this.id);
}