import 'package:flutter/material.dart';
import 'package:food_delivery_app_ui/features/registration/signin/screen/signin_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../features/profile/screen/profile_screen.dart';
import '../../utils/app_color.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});
  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}
class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white70,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            height: 200,
            color: AppColor.darkBlue,
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage("https://imgcdn.stablediffusionweb.com/2024/10/11/324dd355-cda4-4ad1-ac9b-6f8b2ddb7893.jpg"),
                ),
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //crossAxisAlignment: CrossAxisAlignment.end,  (not working here)
                  children: [
                    Text(
                      'Mr Donald Trump',
                      style: GoogleFonts.updock(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                        //fontStyle: FontStyle.italic,
                      ),
                    ),
                    InkWell(
                        child: const Icon(Icons.arrow_drop_down, color: Colors.white,),
                      onTap: (){
                          Get.to(ProfileScreen());
                      },
                    )
                  ],
                )
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.account_circle_rounded),
            title: const Text("Profile"),
            //tileColor: Colors.teal,
            onTap: (){
              Get.to(ProfileScreen());
            },
          ),
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text("Dashboard"),
            //tileColor: Colors.teal,
            onTap: (){
               },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            //textColor: Colors.deepOrange,
            onTap: (){
              },
          ),
          const Spacer(),
          const Divider(color: Colors.grey,),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("LOG OUT"),
            //textColor: Colors.deepOrange,
            onTap: (){
              Get.off(const SigninScreen());
            },
          ),
        ],
      ),
    );
  }
}
