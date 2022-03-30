import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';

import '../../models/todo_model.dart';
import '../../repository/api_repository.dart';

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

  Future<void> fetchNotCompletedTodoApi() async {
    emit(FetchTodoLoading());
    try {
      final List<Todo>? todoList =
          await apiRepository.getTodoNotCompletedList();

      emit(FetchTodoLoaded(todoList: todoList ?? []));
    } catch (e) {
      debugPrint('error1' + e.toString());
    }
  }
}
