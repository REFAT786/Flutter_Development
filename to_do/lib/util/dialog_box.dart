import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  VoidCallback onSave, onCancel;
  DialogBox({super.key, required this.controller, required this.onSave, required this.onCancel});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blueAccent[100],
      content: SizedBox(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(border: OutlineInputBorder(),hintText: "Add a new task"),
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(
                  onPressed: onCancel,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.all(10),
                  color: Colors.orange[300],
                  child: const Text("Cancel", style: TextStyle(fontSize: 17)),
                ),
                MaterialButton(
                  onPressed: onSave,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.all(10),
                  color: Colors.lightBlue[400],
                  child: const Text("Save", style: TextStyle(fontSize: 17),),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
