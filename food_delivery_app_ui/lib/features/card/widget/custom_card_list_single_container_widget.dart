import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';
import '../../category/food_product/widget/custom_quantity_widget.dart';

class CustomCardListSingleContainerWidget extends StatelessWidget {
  const CustomCardListSingleContainerWidget({super.key,
    required this.quantity, required this.amount, required this.onValueChanged, required this.onTapCancel,
    required this.name, required this.image,  this.size
  });

  final int quantity;
  final double amount;
  final int? size;
  final String image;
  final String name;
  final ValueChanged<int> onValueChanged;
  final VoidCallback? onTapCancel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        children: [
          Expanded(
            flex: 4,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColor.darkBlueTwo,
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(image)
                  )
                ),
              )
          ),
          const SizedBox(width: 20,),
          Expanded(
            flex: 7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(name,maxLines: 1,style: const TextStyle(color: Colors.white),),
                      InkWell(
                          onTap: onTapCancel,
                          child: const Icon(Icons.cancel, color: AppColor.red,))
                    ],
                  ),
                  Text("\$ $amount",style: const TextStyle(color: Colors.white)),
                  Row(
                    children: [
                      Text('$size" ', style: const TextStyle(color: Colors.white)),
                      const Spacer(),
                      CustomQuantityWidget(
                          quantity: quantity, onValueChanged: onValueChanged)
                    ],
                  )
                ],
              )
          )

        ],
      ),
    );
  }
}
