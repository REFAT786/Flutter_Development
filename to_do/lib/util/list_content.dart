import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ListContent extends StatelessWidget {

  final String taskName;
  bool isChecked = true;
  void Function(bool?)? onChanged;
  Function(BuildContext?)? deleteFunction;

  ListContent({super.key, required this.taskName, required this.isChecked, this.onChanged, required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
          extentRatio: 0.4,
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              backgroundColor: const Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
              borderRadius: BorderRadius.circular(20),
            )],
      ),
      child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: Colors.lightBlue[200],
            borderRadius: BorderRadius.circular(20),
            boxShadow: [BoxShadow(
                color: Colors.black.withOpacity(0.5),
                offset: const Offset(1,1),
                blurRadius: 1,
                blurStyle: BlurStyle.outer
            )],
          ),
          child: Row(
            children: [
              //check Box
              Checkbox(
                value: isChecked,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              //text
              Text(taskName, style: TextStyle(fontSize: 18, decoration: isChecked ? TextDecoration.lineThrough : TextDecoration.none),)
            ],
          ),
      ),
    );
  }
}
