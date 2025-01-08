import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_color.dart';
import '../../../utils/images.dart';

class ChattingScreen extends StatelessWidget {
  const ChattingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage(Images.serviceShortPhoto),
            ),
            const SizedBox(width: 10),
            const Text("Name"),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding:  EdgeInsets.all(10),
              children:  [
                // Replace with your chat messages
                Text("Chat message 1"),
                Text("Chat message 2"),
                Text("Chat message 1"),
                Text("Chat message 2"),
                Text("Chat message 1"),
                Text("Chat message 2"),
                Text("Chat message 1"),
                Text("Chat message 2"),
                Text("Chat message 1"),
                Text("Chat message 2"),
                Text("Chat message 1"),
                Text("Chat message 2"),
                Text("Chat message 1"),
                Text("Chat message 2"),
                Text("Chat message 1"),
                Text("Chat message 2"),
                Text("Chat message 1"),
                Text("Chat message 2"),
                Text("Chat message 1"),
                Text("Chat message 2"),Text("Chat message 1"),
                Text("Chat message 2"),
                Text("Chat message 1"),
                Text("Chat message 2"),
                Text("Chat message 1"),
                Text("Chat message 2"),
                Text("Chat message 1"),
                Text("Chat message 2"),
                Text("Chat message 1"),
                Text("Chat message 2"),
                Text("Chat message 1"),
                Text("Chat message 2"),
                Text("Chat message 1"),
                Text("Chat message 2"),
                Text("Chat message 1"),
                Text("Chat message 2"),
                Text("Chat message 1"),
                Text("Chat message 2"),
                Text("Chat message 1"),
                Text("Chat message 2"),
                Text("Chat message 1"),
                Text("Chat message 2"),
                Text("Chat message 1"),
                Text("Chat message 2"),
                Text("Chat message 1"),
                Text("Chat message 2"),
                Text("Chat message 1"),
                Text("Chat message 2"),

              ],
            ),
          ),
          SizedBox(height: 5,),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              border: Border(
                top: BorderSide(color: Colors.grey.shade300),
              ),
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.mic),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.link),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Type message...",
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: AppColors.primary,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: AppColors.primary.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  decoration:BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.send),
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
