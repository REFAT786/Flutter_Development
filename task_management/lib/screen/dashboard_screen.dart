import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_management/screen/profile_screen.dart';
import '../model/task.dart';
import '../service/task_service.dart';
import '../widget/task_card.dart';
import 'create_task_screen.dart';
import 'login_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final TaskService taskService = TaskService();
  List<Task> tasks = [];
  String userToken = ''; // Token will be fetched dynamically

  @override
  void initState() {
    super.initState();
    _loadToken(); // Load the token on screen init
  }

  // Fetch the token from SharedPreferences
  Future<void> _loadToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userToken = prefs.getString('token') ?? ''; // Fetch token, default to empty string if not found

    if (userToken.isNotEmpty) {
      await _loadTasks(); // If the token is available, load tasks
    } else {
      print('Token not found. Please log in.');
      Get.offAll(() => LoginScreen()); // Navigate to login screen if token is not available
    }
  }

  // Load tasks using the user token
  Future<void> _loadTasks() async {
    try {
      var response = await taskService.getAllTasks(userToken);
      setState(() {
        tasks = response;
      });
    } catch (e) {
      print('Error loading tasks: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load tasks: $e')),
      );
    }
  }

  // Handle delete task
  Future<void> _deleteTask(Task task) async {
    try {
      var response = await taskService.deleteTask(task.id!, userToken);
      if (response['status'] == 'Success') {
        setState(() {
          tasks.remove(task); // Remove the task from the list
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Task deleted successfully')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to delete task')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error deleting task: $e')),
      );
    }
  }

  // Function to add a new task to the list
  void _addTask(Task task) {
    setState(() {
      tasks.add(task); // Add the new task to the list
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.3,
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        title: Text(
          "Dashboard",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
               tooltip: "Profile",
              onPressed: () {
                // Navigate to ProfileScreen with token
                Get.to(() => ProfileScreen(token: userToken));
              },
              icon: Icon(Icons.account_circle, color: Colors.black,size: 30,),
            ),
          ),
        ],
      ),
      body: tasks.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("No tasks available"),
          ],
        ),
      )
          : ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return TaskCard(
            task: tasks[index],
            onDelete: _deleteTask, // Pass the delete function
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navigate to CreateTaskScreen and await result
          final newTask = await Get.to(() => CreateTaskScreen());
          // If a new task is returned, add it to the list
          if (newTask != null) {
            _addTask(newTask);
          }
        },
        child: Icon(Icons.add),
        tooltip: 'Add Task',
      ),
    );
  }
}
