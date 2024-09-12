import 'dart:convert';
import 'package:http/http.dart' as http;

class TodoServices {
  static Future<bool> addTodo(Map body) async {
    const url = 'https://api.nstack.in/v1/todos';
    final uri = Uri.parse(url);
    final response = await http.post(
      uri,
      body: jsonEncode(body), 
      headers: {'Content-Type': 'application/json'}
    );

    return response.statusCode == 201;
  }

  static Future<List?> getAllTodoItems() async {
    const url = 'https://api.nstack.in/v1/todos?page=1&limit=10';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final result = json['items'];

      return result;
    } 
    else {
      return null;
    }
  }

  static Future<bool> updateTodo(String id, Map body) async {
    final url = 'https://api.nstack.in/v1/todos/$id';
    final uri = Uri.parse(url);
    final response = await http.put(
      uri,
      body: jsonEncode(body), 
      headers: {'Content-Type': 'application/json'}
    );

    return response.statusCode == 200;
  }

  static Future<bool> deleteTodoById(String id) async {
    final url = 'https://api.nstack.in/v1/todos/$id';
    final uri = Uri.parse(url);
    final response = await http.delete(uri);

    return response.statusCode == 200;
  }
}
