

import 'package:bloc/bloc.dart';
import 'package:week2/domain/entities/todo_entity.dart';
import 'package:week2/presentation/sort_types.dart';


import '../../data/repository/todos_data_repository.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  late TodosDataRepository todosDataRepository;
  List<TodoEntity> completed = [];
  List<TodoEntity> notCompleted = [];
  SortTypes sortType = SortTypes.AtoZ;

  TodosBloc() : super(TodosInitState()) {
    todosDataRepository = TodosDataRepository();

    on<TodosGetEvent>(_get);
    on<TodosInsertEvent>(_insert);
    on<TodosUpdateEvent>(_update);
    on<TodosSortEvent>(_sort);
  }

  void _get(TodosGetEvent event, Emitter<TodosState> emit) async {
    emit(TodosLoadingState());

    completed = await todosDataRepository.getCompleted(true);
    notCompleted = await todosDataRepository.getCompleted(false);

    add(TodosSortEvent());
  }

  void _insert(TodosInsertEvent event, Emitter<TodosState> emit) async {
    await todosDataRepository.addTodo(event.todo);
    add(TodosGetEvent());
  }

  void _update(TodosUpdateEvent event, Emitter<TodosState> emit) {
    //emit(TodosLoadingState());

    todosDataRepository.updateCompleted(event.id, event.isCompleted);

    if (event.isCompleted) {
      final removed = notCompleted
          .where((e) => (e.id == event.id))
          .map((e) => e.copyWith(isCompleted: true))
          .toList();
      notCompleted.removeWhere((e) => (e.id == event.id));
      completed.addAll(removed);
    } else {
      final removed = completed
          .where((e) => (e.id == event.id))
          .map((e) => e.copyWith(isCompleted: false))
          .toList();
      completed.removeWhere((e) => (e.id == event.id));
      notCompleted.addAll(removed);
    }

    add(TodosSortEvent());
  }




  void _sort(TodosSortEvent event, Emitter<TodosState> emit) {
    if (event.sortType != null) {
      if (event.sortType == sortType) return;
      sortType = event.sortType!;
    }

    if (sortType == SortTypes.time) {
      completed.sort((a, b) => a.finishTime.compareTo(b.finishTime));
      notCompleted.sort((a, b) => a.finishTime.compareTo(b.finishTime));
    }
    else {
      completed.sort((a, b) => a.name.compareTo(b.name));
      notCompleted.sort((a, b) => a.name.compareTo(b.name));

      if (sortType == SortTypes.ZtoA) {
        completed = completed.reversed.toList();
        notCompleted = notCompleted.reversed.toList();
      }
    }

    emit(TodosLoadedState());
  }

}
