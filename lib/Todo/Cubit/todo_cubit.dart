

import 'package:bloc_state_management/Todo/Models/todo_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoCubit extends Cubit<List<TodoModel>>{
  TodoCubit(): super([]);
  void addTodo(String title){
    if(title.isEmpty){
      return;
    }
    final todo = TodoModel(name: title, createdAt: DateTime.now());
    state.add(todo);
    emit([...state]);
  }
}
