import 'package:cubit_json/models/todo_model.dart';
import 'package:cubit_json/service/api_service.dart';

class ApiRepository {
  final AppService _appService;

  ApiRepository(this._appService);

  Future<List<Todo>?> getTodoList() async {
    final response = await _appService.getTodoData();
    final data = response.data as List<dynamic>; 
    return data.map((e) => Todo.fromMap(e)).toList();
  }
}
