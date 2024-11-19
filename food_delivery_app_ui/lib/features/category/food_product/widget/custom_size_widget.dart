import 'package:flutter/material.dart';

import '../../../../utils/app_color.dart';


class CustomSizeWidget extends StatefulWidget {
  const CustomSizeWidget({super.key, required this.isClicked, required this.sizeNumber,
  required this.onTap});
  final bool isClicked;
  final int sizeNumber;
  final VoidCallback onTap;

  @override
  State<CustomSizeWidget> createState() => _CustomSizeWidgetState();
}

class _CustomSizeWidgetState extends State<CustomSizeWidget> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
          onTap: (){
            widget.onTap();
          },
          child: widget.isClicked?
          CircleAvatar(
            radius: 22,
            backgroundColor: AppColor.orange,
            child: Text('${widget.sizeNumber}"', style: const TextStyle(color: AppColor.white, fontSize: 15),),
          ):CircleAvatar(
            radius: 22,
            backgroundColor: AppColor.whiteTwo,
            child: Text('${widget.sizeNumber}"', style: const TextStyle(fontSize: 15),),
          )
      ),
    );
  }
}
