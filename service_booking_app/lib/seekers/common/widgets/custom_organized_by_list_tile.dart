import 'package:flutter/material.dart';
import 'package:service_booking_app/seekers/utils/app_color.dart';

class CustomOrganizedByListTile extends StatelessWidget {
  CustomOrganizedByListTile({super.key, required this.icon, required this.title, required this.subTitle});
  IconData icon;
  String title, subTitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.secondary300
        ),
        child: Icon(icon),
      ),
      title: Text(title),
      subtitle: Text(subTitle),
    );
  }
}
