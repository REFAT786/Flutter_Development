import 'package:flutter/material.dart';

import '../../utils/images.dart';

class CustomOrganizedByView extends StatelessWidget {
   CustomOrganizedByView({super.key, required this.name,required this.designation});
  String name, designation;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 35,
          backgroundImage: NetworkImage(Images.serviceShortPhoto),
        ),
        SizedBox(height: 5,),
        Text(name),
        SizedBox(height: 5,),
        Text(designation),
      ],
    );
  }
}
