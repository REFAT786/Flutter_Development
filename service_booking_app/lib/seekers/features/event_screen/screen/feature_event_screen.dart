import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_booking_app/seekers/common/widgets/custom_event_list_container.dart';
import 'package:service_booking_app/seekers/common/widgets/custom_search_box.dart';

class FeatureEventScreen extends StatelessWidget {
   FeatureEventScreen({super.key});
  final searchController  = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){Get.back();},
            icon: Icon(Icons.arrow_back_ios)
        ),
        title: Text("Featured Event"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            CustomSearchBox(hintText: "Search for events..", controller: searchController),
            SizedBox(height: 10,),
            GridView.builder(
              itemCount: 9,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(left: 0, right: 0, top: 3, bottom: 10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .87
              ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 5,right: 5, top: 0, bottom: 10),
                  child: CustomEventListContainer(),
                );
              },
            ),
            

          ],
        ),
      ),
    );
  }
}
