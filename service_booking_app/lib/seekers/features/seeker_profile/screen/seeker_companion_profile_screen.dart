import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_booking_app/seekers/common/widgets/custom_button.dart';
import 'package:service_booking_app/seekers/common/widgets/custom_image_decoration.dart';
import 'package:service_booking_app/seekers/common/widgets/custom_interest_field.dart';
import 'package:service_booking_app/seekers/common/widgets/custom_review_container.dart';

import '../../../utils/app_color.dart';
import '../../../utils/images.dart';
import '../../../utils/styles.dart';

class SeekerCompanionProfileScreen extends StatelessWidget {
  const SeekerCompanionProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: true,
        title: Text('Seeker Profile', style: styleBold.copyWith(fontSize: 24),),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 15, right: 15, bottom: 30, top: 10),
        child: Column(
          children: [
            ClipOval(
              child: Image(image: NetworkImage(Images.serviceShortPhoto), height: 120, width: 120,fit: BoxFit.cover,)
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Amélie Claire Dupont',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Lexend',
                      fontWeight: FontWeight.w600,
                      height: 1.33,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.verified,
                    color: AppColors.primary,
                    size: 24,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Outdoor enthusiast who loves to travel',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Lexend',
                fontWeight: FontWeight.w500,
                height: 1.22,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  color: Colors.deepOrangeAccent,
                  size: 24,
                ),
                Icon(
                  Icons.star,
                  color: Colors.deepOrangeAccent,
                  size: 24,
                ),
                Icon(
                  Icons.star,
                  color: Colors.deepOrangeAccent,
                  size: 24,
                ),
                Icon(
                  Icons.star,
                  color: Colors.deepOrangeAccent,
                  size: 24,
                ),
                Icon(
                  Icons.star_half,
                  color: Colors.deepOrangeAccent,
                  size: 24,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "4.9 Rating",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Lexend',
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30, vertical: 10),
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 40,
                        ),
                        Text(
                          'Accept',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 14,
                            fontFamily: 'Lexend',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30, vertical: 10),
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      children: [
                        Icon(
                          Icons.cancel,
                          color: Colors.red,
                          size: 40,
                        ),
                        Text(
                          'Decline',
                          style: TextStyle(
                            color: Color(0xFFFC2E1C),
                            fontSize: 14,
                            fontFamily: 'Lexend',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(height: 10,),
            SizedBox(
              height: 50,
              child: ListView.builder(
                padding: EdgeInsets.all(1),
                itemCount: 7,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5),
                      child: CustomInterestField(name: "Coffee", icon: Icons.coffee),
                    );
                  },
              ),
            ),
            SizedBox(height: 10,),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Review (2)',
                style: TextStyle(
                  color: Color(0xFF0C0C0C),
                  fontSize: 24,
                  fontFamily: 'Lexend',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 10,),
            SizedBox(
              height: 280,
              child: ListView.builder(
                itemCount: 7,
                  shrinkWrap: true,
                  padding: EdgeInsets.all(1),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: CustomReviewContainer(),
                    );
                  },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Photos',
                style: TextStyle(
                  color: Color(0xFF0C0C0C),
                  fontSize: 24,
                  fontFamily: 'Lexend',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    childAspectRatio: .87
                  ),
                  itemCount: 7,
                padding: EdgeInsets.all(1),
                shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: CustomImageDecoration(imageName: Images.serviceShortPhoto),
                    );
                  },
              ),
            ),

            SizedBox(
              height: 20,
            ),
            CustomButton(buttonText: "Give Review",),

          ],
        ),
      ),
    );
  }
}
