import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/cubit/fetch_todo_cubit.dart';
import 'repository/api_repository.dart';
import 'screens/home_page.dart';
import 'service/api_service.dart';

void main() {
  runApp(MyApp(
    appService: AppService(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appService}) : super(key: key);
  final AppService appService;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FetchTodoCubit(apiRepository: ApiRepository(appService)),
      child: MaterialApp(
        title: 'Flutter Json',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Json'),
      ),
    );
  }
}
