import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:service_booking_app/seekers/common/widgets/custom_button.dart';
import 'package:service_booking_app/seekers/common/widgets/custom_verify_msg_container.dart';
import 'package:service_booking_app/seekers/features/auth/otp/screen/otp_screen.dart';

import '../../../../utils/dimensions.dart';
import '../../../../utils/images.dart';
import '../../../home/screen/home_screen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  String? _selectedOption;

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
        title: const Text('Forget Password'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: Dimensions.paddingSizeThirty,
            ),
            SizedBox(
              height: 236,
              width: 236,
              child: Image.asset(Images.forgetPasswordImage)
            ),
            SizedBox(
              height: Dimensions.paddingSizeSmall,
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                      "Select which contact details should we use to reset your password",
                      style: TextStyle(fontSize: 18)
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedOption = "SMS";
                      });
                    },
                    child: CustomVerifyMsgContainer(
                      iconName: FontAwesomeIcons.message,
                      title: "Via SMS",
                      subTitle: "+1 1224434654654",
                      isSelected: _selectedOption == "SMS",
                    ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedOption = "Email";
                      });
                    },
                    child: CustomVerifyMsgContainer(
                      iconName: Icons.email,
                      title: "Via Email",
                      subTitle: "alex**@example.com",
                      isSelected: _selectedOption == "Email",
                    ),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                      onTap: (){Get.to(OtpScreen());},
                      child: CustomButton(buttonText: "Continue",))
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
