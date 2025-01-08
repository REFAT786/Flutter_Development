import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_booking_app/seekers/common/widgets/custom_button.dart';
import 'package:service_booking_app/seekers/utils/styles.dart';

import '../../../common/widgets/Custom_organized_by_view.dart';
import '../../../common/widgets/custom_organized_by_list_tile.dart';
import '../../../utils/app_color.dart';
import '../../../utils/images.dart';


class EvenDetailScreen extends StatelessWidget {
  const EvenDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){Get.back();},
            icon: Icon(Icons.arrow_back_ios_new)
        ),
        title: Text("Event Detail"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: (){}, 
              icon: Icon(Icons.bookmark))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 3,right: 3),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                  child: Image.network(Images.serviceCoverImage)),
              SizedBox(height: 10,),
              Text("Art Exhibition", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
              ListView.builder(
                itemCount: 3,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return CustomOrganizedByListTile(icon: Icons.calendar_month,title: "Date",subTitle: "12 june",);
                  },
              ),
              SizedBox(height: 5,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("About the event", style: styleBold,),
                  SizedBox(height: 10,),
                  Text("Publish on"),
                  SizedBox(height: 10,),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(Images.serviceCoverImage)),
                  SizedBox(height: 10,),
                  Text("hhsskjsdscdiususndhiuscscscuhujsckjs ibvsk "
                      "sbvsckbsicskbsdicbskc scbsifssfsdsfsdfs"
                      "sdfsfsdfsfsfsdfsfsfsfsfsfsf"
                      "sdfsfsdfsfsfsfsdfsfsfsfsfsdfsdfdsf"
                      "sdfsfsdfsfsfsdfsfsfsfsddsfsdfsfsdfadADAFAD"
                      "AsdDSDFSVCASJCBCCGVUADSVSBUDSCH SS"
                      "CHSDFD kxchuidsvhsdfyuvcsiv")

                ],
              ),
              SizedBox(height: 30,),
              Column(
                children: [
                  Row(
                    children: [
                      Text("Organized by",style: styleBold,),
                      Spacer(),
                      Text("See All", style: TextStyle(color: Colors.blue),),
                    ],
                  ),
                  SizedBox(height: 10,),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      itemCount: 5,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: CustomOrganizedByView(name: "Mr",designation: "Hostcadadad",),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 10,),
                  CustomButton(buttonText: "Join Event",),
                  SizedBox(height: 10,),
                  Container(
                    padding: const EdgeInsets.all(18),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: AppColors.secondary ,
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: Center(
                        child: Text(
                          "Add to Calender",
                          style:
                          const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                        )),
                  )

                ],
              ),
          
          
            ],
          ),
        ),
      ),
    );
  }
}
