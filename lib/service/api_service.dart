import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../constains/api_const.dart';

class AppService {
  final Dio _dio = Dio();

  Future getTodoData() async {
    try {
      final Response? response = await _dio.get('$baseUrl$todos');
      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
