part of 'fetch_todo_cubit.dart';

@immutable
abstract class FetchTodoState {}

class FetchTodoInitial extends FetchTodoState {}

class FetchTodoLoading extends FetchTodoState {}

class FetchTodoLoaded extends FetchTodoState {
  final List<Todo> todoList;

  FetchTodoLoaded({required this.todoList});
}

class FetchTodoError extends FetchTodoState {}
