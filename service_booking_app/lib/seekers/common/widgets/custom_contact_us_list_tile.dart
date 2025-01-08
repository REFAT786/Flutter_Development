import 'package:flutter/material.dart';

class CustomContactUsListTile extends StatelessWidget {
  const CustomContactUsListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.call),
      title: Text("Whats up"),
    );
  }
}