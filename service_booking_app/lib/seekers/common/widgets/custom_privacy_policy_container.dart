import 'package:flutter/material.dart';
import 'package:service_booking_app/seekers/utils/styles.dart';

class CustomPrivacyPolicyContainer extends StatelessWidget {
  const CustomPrivacyPolicyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("1. Title", style: styleBold,),
        SizedBox(height: 10,),
        Text("'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus.',")

        
      ],
    );
  }
}
