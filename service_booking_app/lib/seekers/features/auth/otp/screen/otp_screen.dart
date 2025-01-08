import "dart:async";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:service_booking_app/seekers/common/widgets/custom_pin_container.dart";
import "package:service_booking_app/seekers/features/auth/create_new_password/screen/create_new_passport_screen.dart";
import "../../../../common/widgets/custom_button.dart";
import "../../../../utils/app_color.dart";
import "../../../../utils/dimensions.dart";
import "../../../../utils/images.dart";

class OtpScreen extends StatefulWidget {
  OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  int _start = 59; // Countdown time in seconds
  late Timer _timer;
  bool _isResendEnabled = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (_start > 0) {
          _start--;
        } else {
          _isResendEnabled = true;
          _timer.cancel();
        }
      });
    });
  }

  void _resendOTP() {
    setState(() {
      _start = 59;
      _isResendEnabled = false;
    });
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: true,
        title: const Text('Enter OTP'),
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
              child: Image.asset(Images.otpImage)
            ),
            SizedBox(
              height: Dimensions.paddingSizeSmall,
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                      "Code has been send to your id",
                      style: TextStyle(fontSize: 18)
                  ),

                  const SizedBox(height: 15),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomPinContainer(),
                      SizedBox(width: 15),
                      CustomPinContainer(),
                      SizedBox(width: 15),
                      CustomPinContainer(),
                      SizedBox(width: 15),
                      CustomPinContainer(),

                    ],
                  ),

                  const SizedBox(height: 15),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Resend code in "),
                      Text("$_start", style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),),
                      Text(" sec")
                    ],
                  ),

                  const SizedBox(height: 40),

                  GestureDetector(
                    onTap: (){Get.to(CreateNewPassportScreen());},
                      child: CustomButton(buttonText: "Verify",)
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
