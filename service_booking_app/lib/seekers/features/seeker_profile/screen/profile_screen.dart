import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:service_booking_app/seekers/common/widgets/custom_profile_list_tile.dart';
import 'package:service_booking_app/seekers/features/seeker_profile/screen/edit_profile_screen.dart';
import 'package:service_booking_app/seekers/features/seeker_profile/screen/help_center_screen.dart';
import 'package:service_booking_app/seekers/features/seeker_profile/screen/notification_screen.dart';
import 'package:service_booking_app/seekers/features/seeker_profile/screen/privacy_policy_screen.dart';
import 'package:service_booking_app/seekers/features/seeker_profile/screen/review_screen.dart';
import 'package:service_booking_app/seekers/utils/images.dart';
import 'package:service_booking_app/seekers/utils/styles.dart';

import '../../../utils/app_color.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Profile",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(Images.serviceShortPhoto),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: const Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Full name", style: styleBold,),
                SizedBox(width: 5,),
                Icon(Icons.verified, color: Colors.lightBlue,)
              ],
            ),
            const SizedBox(height: 10),
            Text("mail@gmail.com"),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(AppColors.primary)
              ),
                onPressed: (){}, 
                child: Text("2400 points", style: styleBold.copyWith(color: AppColors.white),)),
            const SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.primary
              ),
              child: ListTile(
                leading: Icon(Icons.workspace_premium, color: Colors.deepOrangeAccent,size: 40,),
                title: Text("Join Premium!", style: styleBold.copyWith(color: AppColors.white, fontSize: 20),),
                trailing: Icon(Icons.arrow_forward_ios, color: AppColors.white,size: 16,),
              ),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              itemCount: 5,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){Get.to(ReviewScreen()); },
                      child: CustomProfileListTile());
                },
            )

            
            // Additional fields can go here.
          ],
        ),
      ),
    );
  }
}
