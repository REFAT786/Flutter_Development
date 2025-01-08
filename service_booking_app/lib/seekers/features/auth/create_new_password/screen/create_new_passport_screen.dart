import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:service_booking_app/seekers/features/auth/choose_interest/screen/choose_interest_screen.dart';
import 'package:service_booking_app/seekers/features/auth/fill_profile/screen/fill_profile_screen.dart';
import 'package:service_booking_app/seekers/features/home/screen/home_screen.dart';

import '../../../../common/widgets/custom_button.dart';
import '../../../../common/widgets/custom_icon_container.dart';
import '../../../../common/widgets/custom_text_field.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/dimensions.dart';
import '../../../../utils/images.dart';
import '../../forget_password/screen/forget_password_screen.dart';
import '../../sign_up/screen/sign_up_screen.dart';

class CreateNewPassportScreen extends StatefulWidget {
  const CreateNewPassportScreen({super.key});

  @override
  State<CreateNewPassportScreen> createState() => _CreateNewPassportScreenState();
}

class _CreateNewPassportScreenState extends State<CreateNewPassportScreen> {

  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: FaIcon(FontAwesomeIcons.arrowLeft, color: AppColors.black,),
          onPressed: (){Get.back();},
        ),
        centerTitle: true,
        title: Text('Create New Passport'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Dimensions.paddingSizeThirty,
            ),
            Center(
              child: SizedBox(
                height: 236,
                width: 236,
                child: Image.asset(Images.newPasswordPageImage)
              ),
            ),
            SizedBox(
              height: Dimensions.paddingSizeSmall,
            ),

            SizedBox(height: 10,),
            Text("Create New Password", style: TextStyle(
              color: Color(0xFF212121),
              fontSize: 18,
              fontFamily: 'Lexend',
              fontWeight: FontWeight.w500,
              height: 1.40,
              letterSpacing: 0.20,
            ),),
            SizedBox(height: 8,),
            Column(
              children: [
                CustomTextField(prefixIcon: Icons.lock, hintText: "New Password", isSuffix: true, controller: newPasswordController),
                SizedBox(height: 10,),
                CustomTextField(prefixIcon: Icons.lock, hintText: "Confirm Password", isSuffix: true, controller: confirmPasswordController),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Checkbox(
                      value: rememberMe,
                      activeColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      onChanged: (bool? newValue) {
                        setState(() {
                          rememberMe = newValue ?? false;
                        });
                      },
                    ),
                    const Text(
                      "Remember me",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Lexend',
                          fontWeight: FontWeight.w600,
                          height: 1.40,
                          letterSpacing: 0.20,
                        ),
                    ),

                  ],
                ),
                SizedBox(height: 10,),
                InkWell(
                  onTap: (){Get.to(ChooseInterestScreen());},
                    child: CustomButton(buttonText: "Continue",)),

              ],
            ),
            SizedBox(height: 10,),


          ],
        ),
      ),
    );
  }
}
