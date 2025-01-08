import 'package:flutter/material.dart';

import '../../utils/images.dart';

class CustomChatListTile extends StatelessWidget {
   CustomChatListTile({super.key, required this.profileImage, required this.name, required this.msg, required this.time});
  String name, msg, time, profileImage;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 20,
        backgroundImage: NetworkImage(profileImage),
      ),
      title: Text(name),
      subtitle: Text(msg),
      trailing: Text(time),

    );
  }
}
