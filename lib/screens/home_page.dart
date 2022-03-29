
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/cubit/fetch_todo_cubit.dart';
import '../models/todo_model.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        elevation: 0.0,
      ),
      floatingActionButton: ElevatedButton(
        child: const Text('получить данные'),
        onPressed: () {
          context.read<FetchTodoCubit>().fetchTodoApi();
        },
      ),
      body: BlocBuilder<FetchTodoCubit, FetchTodoState>(
        builder: (context, state) {
          if (state is FetchTodoLoaded) {
            final List<Todo> todoList = state.todoList;
            return ListView.builder(
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: todoList[i].completed
                                ? Colors.green
                                : Colors.red,
                          ),
                          child: Center(
                            child: Text(
                              todoList[i].id.toString(),
                              style: const TextStyle(
                                fontSize: 32,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'USER ID: ${todoList[i].userId}',
                              style: const TextStyle(
                                fontSize: 22,
                              ),
                            ),
                            SizedBox(
                              width: 300,
                              child: Text(
                                todoList[i].title.toString(),
                                style: const TextStyle(
                                  fontSize: 22,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: todoList.length,
              shrinkWrap: true,
            );
          } else if (state is FetchTodoLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return const Center(child: Text('пусто'));
        },
      ),
    );
  }
}
