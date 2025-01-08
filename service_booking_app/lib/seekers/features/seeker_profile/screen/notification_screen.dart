import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final Map<String, bool> notifications = {
    "General Notification": true,
    "New Services Available": false,
    "App Updates": true,
    "Subscription": false,
    "Customer Feedback": true,
    "Product Enhancements": false,
    "Feature Requests": true,
    "Bug Fixes": false,
    "Promotional Offers": true,
    "User Interface Improvements": false,
    "Security Updates": true,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          "Notification",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: ListView.separated(
          itemCount: notifications.length,
          separatorBuilder: (context, index) => Divider(height: 1),
          itemBuilder: (context, index) {
            String title = notifications.keys.elementAt(index);
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Switch(
                  value: notifications[title]!,
                  onChanged: (value) {
                    setState(() {
                      notifications[title] = value;
                    });
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}