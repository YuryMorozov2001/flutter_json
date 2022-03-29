import '../models/todo_model.dart';
import '../service/api_service.dart';

class ApiRepository {
  final AppService appService;

  ApiRepository(this.appService);

  Future<List<Todo>?> getTodoList() async {
    final response = await appService.getTodoData();
    final data = response.data as List<dynamic>;
    return data.map((e) => Todo.fromMap(e)).toList();
  }
}
