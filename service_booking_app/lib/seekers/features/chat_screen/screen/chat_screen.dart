import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:service_booking_app/seekers/common/widgets/custom_chat_list_tile.dart';
import 'package:service_booking_app/seekers/common/widgets/custom_search_box.dart';
import 'package:service_booking_app/seekers/features/chat_screen/screen/chatting_screen.dart';
import 'package:service_booking_app/seekers/utils/images.dart';
import 'package:service_booking_app/seekers/utils/styles.dart';

class ChatScreen extends StatelessWidget {
   ChatScreen({super.key});
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            SizedBox(height: 40,),
            Text("Chat", style: styleBold,),
            SizedBox(height: 10,),
            CustomSearchBox( hintText: "Search fort events..", controller: searchController),
            ListView.builder(
              itemCount: 7,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){Get.to(ChattingScreen());},
                      child: CustomChatListTile(profileImage: Images.serviceShortPhoto,name: "Bird",msg: "I am a bird",time: "12.00 Am",));
                },
            )

          ],
        ),
      ),

    );
  }
}
