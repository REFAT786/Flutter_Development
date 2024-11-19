import 'package:flutter/material.dart';

import '../../../../utils/app_color.dart';


class CustomQuantityWidget extends StatefulWidget {
  const CustomQuantityWidget({super.key, required this.quantity, required this.onValueChanged});
  final int quantity;
  final ValueChanged<int> onValueChanged;
  @override
  State<CustomQuantityWidget> createState() => _CustomQuantityWidgetState();
}

class _CustomQuantityWidgetState extends State<CustomQuantityWidget> {
  late int quantity;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    quantity = widget.quantity;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
          color: AppColor.darkBlue,
          borderRadius: BorderRadius.circular(40)
      ),
      child: Row(
        children: [
          ElevatedButton(
              onPressed: (){
                setState(() {
                  quantity = (quantity > 1) ? quantity-1 : 1;
                  widget.onValueChanged(quantity);
                });
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(8),
                backgroundColor: const Color(0xff525355),
              ),

              child: const Icon(Icons.remove, color: AppColor.white,size: 15,)),
          Text("$quantity", style: const TextStyle(color: AppColor.white, fontWeight: FontWeight.bold),),
          ElevatedButton(
              onPressed: (){
                setState(() {
                  quantity++;
                  widget.onValueChanged(quantity);
                });
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(8),
                backgroundColor: const Color(0xff525355),
              ),

              child: const Icon(Icons.add, color: AppColor.white,size: 15,)),
        ],
      ),
    );
  }
}
