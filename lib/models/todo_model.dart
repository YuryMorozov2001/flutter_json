// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Todo {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Todo(this.userId, this.id, this.title, this.completed);

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      map['userId'] as int,
      map['id'] as int,
      map['title'] as String,
      map['completed'] as bool,
    );
  }

  factory Todo.fromJson(String source) =>
      Todo.fromMap(json.decode(source) as Map<String, dynamic>);
}
