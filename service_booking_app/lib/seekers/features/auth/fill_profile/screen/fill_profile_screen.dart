import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:service_booking_app/seekers/common/widgets/custom_button.dart';
import '../../../../utils/app_color.dart';
import '../../../seeker_profile/screen/seeker_companion_profile_screen.dart';

class FillProfileScreen extends StatefulWidget {
  const FillProfileScreen({super.key});

  @override
  State<FillProfileScreen> createState() => _FillProfileScreenState();
}

class _FillProfileScreenState extends State<FillProfileScreen> {
  String? _selectedGender; // Holds the selected gender
  final List<String> _genders = ['Male', 'Female', 'Other']; // Dropdown options

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              'Fill Your Profile',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            Stack(
              children: [
                CircleAvatar(
                  radius: 60,
                  //backgroundColor: Colors.red,
                ),
                Positioned(
                    bottom: 3,
                    right: 3,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 16,
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.secondary100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                //cursorColor: AppColors.black,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(16),
                  border: InputBorder.none,
                  hintText: "Full Name",
                  hintStyle: const TextStyle(
                      color: Colors.black, fontSize: 15),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.secondary100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                maxLines: 2, // Maximum number of lines
                maxLength: 70,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(16),
                    hintText: "Bio...",
                    hintStyle: const TextStyle(
                        color: Colors.black, fontSize: 15),
                    border: InputBorder.none),

              ),
            ),
            SizedBox(height: 10,),

            IntlPhoneField(
              decoration: InputDecoration(
                hintText: 'Phone Number',
                fillColor: AppColors.secondary100,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              initialCountryCode: 'US',
              onChanged: (phone) {
                print(phone.completeNumber);
              },
            ),

            SizedBox(height: 10,),

            DropdownButtonFormField<String>(
              value: _selectedGender,
              items: _genders.map((String gender) {
                return DropdownMenuItem<String>(
                  value: gender,
                  child: Text(gender),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedGender = newValue;
                });
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.secondary100,
                hintText: "Gender",
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            Spacer(),

            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: (){},
                    child: CustomButton(
                      buttonText: "Skip",
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: InkWell(
                    onTap: (){Get.to(SeekerCompanionProfileScreen());},
                    child: CustomButton(
                      buttonText: "Continue",
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
