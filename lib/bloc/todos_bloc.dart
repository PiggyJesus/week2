

import 'package:bloc/bloc.dart';
import 'package:week2/main.dart';

import '../database/database.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  List<Todo> completed = [];
  List<Todo> notCompleted = [];

  TodosBloc():super(TodosInitState()) {
    on<TodosGetEvent>(_get);
  }


  void _get(TodosGetEvent event, Emitter<TodosState> emit) async {
    emit(TodosLoadingState());
    completed = await appDb.getCompleted(true);
    notCompleted = await appDb.getCompleted(false);
    emit(TodosLoadedState());
  }


}