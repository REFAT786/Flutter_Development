import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/task.dart';

class TaskService {
  static const String _baseUrl = 'http://206.189.138.45:7152';

  // Create Task
  Future<Map<String, dynamic>> createTask(String title, String description, String token) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/task/create-task'),
      headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $token'},
      body: jsonEncode({'title': title, 'description': description}),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to create task');
    }
  }

  // Get All Tasks
  Future<List<Task>> getAllTasks(String token) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/task/get-all-task'),
      headers: {'Authorization': 'Bearer $token'},
    );

    List<Task> tasks = [];
    if (response.statusCode == 200) {
      final List<dynamic> taskJson = jsonDecode(response.body)['data']['myTasks'];
      tasks = taskJson.map((task) => Task.fromJson(task)).toList();
    }
    return tasks;
  }

  // Delete Task
  Future<Map<String, dynamic>> deleteTask(String taskId, String token) async {
    final response = await http.delete(
      Uri.parse('$_baseUrl/task/delete-task/$taskId'),
      headers: {'Authorization': 'Bearer $token'},
    );

    return jsonDecode(response.body);
  }
}
