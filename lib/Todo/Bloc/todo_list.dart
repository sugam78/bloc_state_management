import 'package:bloc_state_management/Todo/Bloc/add_todo_page.dart';
import 'package:bloc_state_management/Todo/Models/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/todo_bloc.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: BlocBuilder<TodoBloc,List<TodoModel>>(
          builder: (context,state) {
            return ListView.builder(
                itemCount: state.length,
                itemBuilder: (context,index){
                  TodoModel todo =state[index];
                  debugPrint(todo.toString());
                  return ListTile(
                    title: Text(todo.name),
                    trailing: Text(todo.createdAt.toString()),
                  );
                });
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddTodoPage()));
        },
        tooltip: 'Add Todo',
        child: const Icon(Icons.add),
      ),
    );
  }
}