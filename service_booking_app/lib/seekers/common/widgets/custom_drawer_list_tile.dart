import 'package:flutter/material.dart';

class CustomDrawerListTile extends StatelessWidget {
   CustomDrawerListTile({super.key, required this.leadingIcon,required this.title, required this.onTabFunction});
   final String title;
   final IconData leadingIcon;
   final VoidCallback onTabFunction;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:  Icon(leadingIcon, color: Colors.blue,),
      title:  Text(title, style: TextStyle(fontWeight: FontWeight.bold),),
      //tileColor: Colors.teal,
      onTap: onTabFunction,
    );
  }
}
