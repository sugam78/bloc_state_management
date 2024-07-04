
import 'package:bloc_state_management/Todo/Models/todo_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, List<TodoModel>> {
  TodoBloc() : super([]) {
    on<TodoAdd>(_onTodoAdd);
  }
  void _onTodoAdd(TodoAdd event, emit) {
    final todo = event.todo;
    state.add(todo);
    emit([...state]);
  }
}
