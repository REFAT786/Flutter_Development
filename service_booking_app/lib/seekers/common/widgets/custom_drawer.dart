import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_booking_app/seekers/common/widgets/custom_drawer_list_tile.dart';
import 'package:service_booking_app/seekers/features/calender_screen/screen/calender_screen.dart';
import 'package:service_booking_app/seekers/features/invitation_screen/screen/invitation_screen.dart';
import 'package:service_booking_app/seekers/features/seeker_profile/screen/seeker_companion_profile_screen.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});
  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}
class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 50, left: 15,right: 15, bottom: 15),
            width: double.infinity,
            //height: 200,
            //color: Colors.indigo,
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage("https://imgcdn.stablediffusionweb.com/2024/10/11/324dd355-cda4-4ad1-ac9b-6f8b2ddb7893.jpg"),
                ),
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //crossAxisAlignment: CrossAxisAlignment.end,  (not working here)
                  children: [
                    Text(
                      'Mr Donald Trump',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        //color: Colors.white
                        //fontStyle: FontStyle.italic,
                      ),
                    ),
                    InkWell(
                        child: const Icon(Icons.arrow_drop_down, color: Colors.black,),
                      onTap: (){
                          Get.to(SeekerCompanionProfileScreen());
                      },
                    )
                  ],
                )
              ],
            ),
          ),
          CustomDrawerListTile(leadingIcon: Icons.calendar_month , title: "Calender", onTabFunction: (){Get.to(CalenderScreen());}),
          CustomDrawerListTile(leadingIcon: Icons.bookmark , title: "Bookmark", onTabFunction: (){}),
          CustomDrawerListTile(leadingIcon: Icons.insert_invitation , title: "Invitation", onTabFunction: (){Get.to(InvitationScreen());}),
        ],
      ),
    );
  }
}
