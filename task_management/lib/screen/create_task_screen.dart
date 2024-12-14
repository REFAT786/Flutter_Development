import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/task.dart';
import '../service/task_service.dart';

class CreateTaskScreen extends StatefulWidget {
  @override
  _CreateTaskScreenState createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  // Function to get the token from SharedPreferences
  Future<String?> _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');  // Get the stored token
  }

  // Create Task function
  void _createTask() async {
    // Fetch the token from SharedPreferences
    String? token = await _getToken();

    if (token == null || token.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please log in first!')));
      return;
    }

    try {
      // Call TaskService to create a task
      var response = await TaskService().createTask(
        _titleController.text,
        _descriptionController.text,
        token!,  // Pass the token here
      );

      if (response['status'] == 'Success') {
        Task newTask = Task.fromJson(response['data']);  // Assuming response has the task data
        Navigator.pop(context, newTask);  // Return the new task to DashboardScreen
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to create task')));
      }
    } catch (e) {
      // Show an error if the API request fails
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0.3,
          shadowColor: Colors.black,
          title: Text("Create Task"), backgroundColor: Colors.white),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17, vertical: 30),
        child: Column(
          children: [
            TextField(controller: _titleController,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    labelText: 'Title',
                    border: UnderlineInputBorder(borderRadius: BorderRadius.circular(18))
                )
            ),
            SizedBox(height: 30),
            TextField(controller: _descriptionController,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    border: UnderlineInputBorder(borderRadius: BorderRadius.circular(18)),
                    labelText: 'Description'
                )
            ),
            SizedBox(height: 30),
            Align(
              alignment: Alignment.topRight,
              child: ElevatedButton(
                style: ButtonStyle(
                  shadowColor: WidgetStatePropertyAll(Colors.blueAccent),elevation: WidgetStatePropertyAll(1),
                    backgroundColor: WidgetStatePropertyAll(Colors.white70),
                    padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 30, vertical: 17)),
                ),
                onPressed: _createTask,
                child: Text('Add Task', style: TextStyle(color: Colors.black)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
