import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do/util/dialog_box.dart';
import '../util/list_content.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  final _controller = TextEditingController();
  List<String> taskNames = [];
  List<bool> taskStatus = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  // Load data from SharedPreferences
  Future<void> _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    taskNames = prefs.getStringList('taskNames') ?? [];
    taskStatus = prefs.getStringList('taskStatus')?.map((status) => status == 'true').toList() ?? [];
    setState(() {});
  }

  // Save data to SharedPreferences
  Future<void> _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('taskNames', taskNames);
    await prefs.setStringList('taskStatus', taskStatus.map((status) => status.toString()).toList());
  }

  // Toggle checkbox selection
  void checkBoxSelection(bool? value, int index) {
    setState(() {
      taskStatus[index] = !taskStatus[index];
    });
    _saveData();
  }

  // Add new task
  void _addTask() {
    setState(() {
      taskNames.insert(0, _controller.text);
      taskStatus.insert(0,false);
    });
    _saveData();
    _controller.clear();
  }

  // Remove task
  void _removeTask(int index) {
    setState(() {
      taskNames.removeAt(index);
      taskStatus.removeAt(index);
    });
    _saveData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[200],
      appBar: AppBar(
        centerTitle: true,
        title: const Text("TO DO"),
        backgroundColor: Colors.orange[200],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return DialogBox(
                controller: _controller,
                onSave: () {
                  _addTask();
                  Navigator.of(context).pop();
                },
                onCancel: () {
                  Navigator.of(context).pop();
                  _controller.clear();
                },
              );
            },
          );
        },
        backgroundColor: Colors.orange[200],
        child: const Icon(Icons.add),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blueAccent[100],
          borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
        ),
        padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
        child: ListView.builder(
          itemCount: taskNames.length,
          itemBuilder: (BuildContext context, int index) {
            return ListContent(
              taskName: taskNames[index],
              isChecked: taskStatus[index],
              onChanged: (value) => checkBoxSelection(value, index),
              deleteFunction: (BuildContext) => _removeTask(index),
            );
          },
        ),
      ),
    );
  }
}
