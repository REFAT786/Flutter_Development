import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widget/custom_app_bar.dart';
import '../../../../utils/app_color.dart';
import '../../card/screen/card_screen.dart';
import '../../home/screen/home_screen.dart';
import '../../registration/signin/screen/signin_screen.dart';
import '../model/profile_item_data.dart';
import '../widget/custom_profile_container.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  List<ProfileItemData> option = [
    ProfileItemData(icon: Icons.person_outline, title: "Personal Info", iconColor: Colors.orange, page: const HomeScreen(), ),
    ProfileItemData(icon: Icons.location_on_outlined, title: "Addresses", iconColor: Colors.blue, page: const CardScreen()),
  ];
  List<ProfileItemData> option1 = [
    ProfileItemData(icon: Icons.card_travel, title: "Cart", iconColor: Colors.lightBlueAccent, page: const HomeScreen(), ),
    ProfileItemData(icon: Icons.heart_broken_rounded, title: "Favorite", iconColor: Colors.red, page: const CardScreen()),
    ProfileItemData(icon: Icons.notifications, title: "Notification", iconColor: Colors.orange, page: const CardScreen()),
  ];
  List<ProfileItemData> option2 = [
    ProfileItemData(icon: Icons.logout, title: "Log Out", iconColor: Colors.red, page: const SigninScreen(), ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 40, left: 25, right: 25, bottom: 15),
        child: Column(
          children: [
            CustomAppBar(
              onTapButton: () {
                Get.off(const HomeScreen());
              },
              leadingBGColor: AppColor.whiteThree,
              leadingIcon: Icons.arrow_back_ios_new,
              leadingIconColor: AppColor.darkBlue,
              title: "Profile",
              titleColor: AppColor.black,
              suffixBGColor: AppColor.whiteThree,
              suffixIcon: Icons.more_horiz,
              suffixIconColor: AppColor.darkBlue,
              onTapCard: () {},
            ),
            const SizedBox(height: 10),
            const Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage("https://imgcdn.stablediffusionweb.com/2024/10/11/324dd355-cda4-4ad1-ac9b-6f8b2ddb7893.jpg"),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Mr Donald Trump", style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("I am a businessman"),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColor.whiteThree,
              ),
              child: ListView.builder(
                padding: const EdgeInsets.all(0),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: option.length,
                itemBuilder: (context, index) {
                  return CustomProfileContainer(
                    option: option[index],
                    onTapPage: () {
                      Get.to(option[index].page);
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColor.whiteThree,
              ),
              child: ListView.builder(
                padding: const EdgeInsets.all(0),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: option1.length,
                itemBuilder: (context, index) {
                  return CustomProfileContainer(
                    option: option1[index],
                    onTapPage: () {
                      Get.to(option1[index].page);
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColor.whiteThree,
              ),
              child: ListView.builder(
                padding: const EdgeInsets.all(0),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: option2.length,
                itemBuilder: (context, index) {
                  return CustomProfileContainer(
                    option: option2[index],
                    onTapPage: () {
                      Get.to(option2[index].page);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
