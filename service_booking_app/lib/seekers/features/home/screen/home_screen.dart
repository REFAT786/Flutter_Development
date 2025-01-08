import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_booking_app/seekers/common/widgets/custom_invitation_container.dart';
import 'package:service_booking_app/seekers/features/calender_screen/screen/calender_screen.dart';
import 'package:service_booking_app/seekers/features/invitation_screen/screen/invitation_screen.dart';

import '../../../common/widgets/custom_current_week_container.dart';
import '../../../common/widgets/custom_drawer.dart';
import '../../../common/widgets/custom_event_list_container.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 10,),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 20),
              width: double.infinity,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: (){
                        CustomDrawer();
                        _globalKey.currentState!.openDrawer();
                      },
                      icon: Icon(Icons.menu)
                  ),
                  InkWell(
                    onTap: (){

                    },
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Current Location"),
                            Icon(Icons.keyboard_arrow_down, color: Colors.blue,)
                          ],
                        ),
                        Text("New York, USA", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(right: 13, left: 13),
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(0, 1),
                            ),
                          ]
                      ),
                      child: Icon(Icons.notifications, size: 20,),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Your Invitation", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                      Spacer(),
                      TextButton(
                          onPressed: (){Get.to(InvitationScreen()); },
                          child: Text("See all", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),)
                      )
                    ],
                  ),
                  SizedBox(height: 10,),
                  SizedBox(
                    height: 222,
                    child: ListView.builder(
                      padding: EdgeInsets.all(1),
                      shrinkWrap: true,
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: CustomInvitationContainer());
                      },

                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text("Nearby events", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                      Spacer(),
                      TextButton(
                          onPressed: (){Get.to(CalenderScreen()); },
                          child: Text("See all", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),)
                      )

                    ],
                  ),
                  SizedBox(height: 10,),
                  SizedBox(
                    height: 212,
                    child: ListView.builder(
                      padding: EdgeInsets.all(1),
                      shrinkWrap: true,
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: CustomEventListContainer(),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text("Current Week", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                      Spacer(),
                      TextButton(
                          onPressed: (){Get.to(()); },
                          child: Text("See all", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),)
                      )
                    ],
                  ),
                  SizedBox(height: 10,),
                  SizedBox(
                    height: 87,
                    child: ListView.builder(
                      padding: EdgeInsets.all(1),
                      itemCount: 5,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: CustomCurrentWeekContainer(),
                        );
                      },
                    ),
                  ),


                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
