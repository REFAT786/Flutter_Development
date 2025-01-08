import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:service_booking_app/seekers/common/widgets/custom_activity_container.dart';
import 'package:service_booking_app/seekers/common/widgets/custom_button.dart';
import 'package:service_booking_app/seekers/common/widgets/custom_event_list_container.dart';
import 'package:service_booking_app/seekers/common/widgets/custom_search_box.dart';
import 'package:service_booking_app/seekers/features/event_screen/screen/feature_event_screen.dart';
import 'package:service_booking_app/seekers/features/event_screen/screen/my_event_screen.dart';

import 'even_detail_screen.dart';

class EventScreen extends StatelessWidget {
   EventScreen({super.key});
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding:  EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Event",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            CustomSearchBox( hintText: "Search for events", controller: searchController),
            const SizedBox(height: 10),
            SizedBox(
              height: 45,
              child: ListView.builder(
                shrinkWrap: true,
                  itemCount: 7,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(right: 8),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: CustomActivityContainer(name: "Outdoor Activities"),
                    );
                  },
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text("Featured Events", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                Spacer(),
                TextButton(onPressed: (){Get.to(FeatureEventScreen()); },
                    child: Text("See All", style: TextStyle(color: Colors.blue),)
                )
              ],
            ),
            //SizedBox(height: 5,),
            GridView.builder(
              itemCount: 4,
                shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(left: 0, right: 0, top: 3, bottom: 10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  childAspectRatio: .85
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 5,right: 5, top: 0, bottom: 10),
                    child: InkWell(
                      onTap: (){
                        Get.to(EvenDetailScreen());
                      },
                        child: CustomEventListContainer()),
                  );
                },
            ),
            const SizedBox(height: 0),

            Row(
              children: [
                Text("My Event", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                Spacer(),
                TextButton(onPressed: (){Get.to(MyEventScreen());},
                    child: Text("See All", style: TextStyle(color: Colors.blue),)
                )
              ],
            ),
            SizedBox(
              height: 240,
              child: ListView.builder(
                padding: EdgeInsets.only(left: 0, right: 0, top: 3, bottom: 10),
                shrinkWrap: true,
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 5,right: 5, top: 0, bottom: 10),
                      child: CustomEventListContainer(),
                    );
                  },
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.topLeft,
                child: Text("Upcoming Event", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)),
            const SizedBox(height: 10),
            GridView.builder(
              itemCount: 4,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(left: 0, right: 0, top: 3, bottom: 10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .85
              ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 5,right: 5, top: 0, bottom: 10),
                  child: CustomEventListContainer(),
                );
              },
            ),
            const SizedBox(height: 10),
            CustomButton(buttonText: "Create New Event",)



          ],
        ),
      ),
    );
  }
}
