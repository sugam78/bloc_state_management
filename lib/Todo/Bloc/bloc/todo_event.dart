part of 'todo_bloc.dart';


sealed class TodoEvent {}


final class TodoAdd extends TodoEvent{
final TodoModel todo ;
TodoAdd(this.todo);
}
