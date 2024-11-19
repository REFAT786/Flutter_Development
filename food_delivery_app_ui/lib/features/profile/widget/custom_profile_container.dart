import 'package:flutter/material.dart';

import '../model/profile_item_data.dart';

class CustomProfileContainer extends StatelessWidget {
  CustomProfileContainer(
      {super.key, required this.option, required this.onTapPage});
  final ProfileItemData option;
  void Function()? onTapPage;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        child: Icon(option.icon, color: option.iconColor, size: 15,),
      ),
      title: Text(option.title, style: const TextStyle(fontSize: 15),),
      trailing:
          const Icon(Icons.arrow_forward_ios, size: 15, color: Colors.grey,),
      onTap: onTapPage,
    );
  }
}
