import 'package:flutter/material.dart';

class CustomProfileListTile extends StatelessWidget {
  const CustomProfileListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.account_circle),
      title: Text("Edit Profile"),
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }
}
