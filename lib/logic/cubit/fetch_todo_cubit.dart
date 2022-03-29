import 'package:bloc/bloc.dart';
import 'package:cubit_json/models/todo_model.dart';
import 'package:cubit_json/repository/api_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

part 'fetch_todo_state.dart';

class FetchTodoCubit extends Cubit<FetchTodoState> {
  final ApiRepository apiRepository;
  FetchTodoCubit({required this.apiRepository}) : super(FetchTodoInitial());
  Future<void> fetchTodoApi() async {
    emit(FetchTodoLoading());
    try {
      final List<Todo>? todoList = await apiRepository.getTodoList();
      emit(FetchTodoLoaded(todoList: todoList ?? []));
    } catch (e) {
      debugPrint('error' + e.toString());
    }
  }
}
