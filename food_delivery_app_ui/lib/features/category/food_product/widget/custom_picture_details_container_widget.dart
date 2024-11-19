import 'package:flutter/material.dart';

import '../../../../utils/app_color.dart';

class CustomPictureDetailsContainerWidget extends StatelessWidget {
  const CustomPictureDetailsContainerWidget({super.key, required this.foodTypeImage});
  final String foodTypeImage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center, // Center the child inside the stack
        children: [
          Container(
            width: double.infinity,
            height: 150, // Set a height for the container if needed
            decoration: BoxDecoration(
              color: AppColor.lightOrange2,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          Positioned(
            top: -25, // Slightly offset from the top
            child: CircleAvatar(
              backgroundColor: Colors.orange,
              radius: 70,
              backgroundImage: AssetImage(foodTypeImage),

            )
          ),
          Positioned(
            bottom: 8,
            right: 8,
            child: CircleAvatar(
              backgroundColor: AppColor.whiteTwo.withOpacity(0.5),
              radius: 20, // Adjust radius to fit icon size
              child: const Icon(
                Icons.favorite, // Changed to 'favorite' for heart icon
                color: Colors.redAccent, // Set color of the icon
              ),
            ),
          ),
        ],
      ),
    );
  }
}
