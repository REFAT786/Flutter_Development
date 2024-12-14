import 'package:flutter/material.dart';
import '../model/task.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  final Function onDelete;  // Callback function for deleting a task

  TaskCard({required this.task, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white70,
      shadowColor: Colors.blueAccent,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: ListTile(
        title: Text(task.title!),
        subtitle: Text(task.description!),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.redAccent,),
          onPressed: () {
            // Call the delete function passed from the parent widget
            onDelete(task);
          },
        ),
        onTap: () {
          Navigator.pushNamed(context, '/task_detail', arguments: task);
        },
      ),
    );
  }
}
