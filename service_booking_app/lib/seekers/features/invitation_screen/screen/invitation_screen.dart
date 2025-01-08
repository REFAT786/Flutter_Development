import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:service_booking_app/seekers/common/widgets/custom_calendar_category_container.dart';
import 'package:service_booking_app/seekers/common/widgets/custom_invitation_container.dart';

import '../../../utils/styles.dart';

class InvitationScreen extends StatelessWidget {
  const InvitationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading:  IconButton(
            icon: Icon(Icons.arrow_back_ios, size: 30,),
            onPressed: () => Get.back() ,),
          centerTitle: true,
          title: Text('Invitation', style: styleBold.copyWith(fontSize: 24),),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                child: Text('All', style: styleBold.copyWith(fontSize: 20),),
              ),
              Tab(
                child: Text('Going (1)',style: styleBold.copyWith(fontSize: 20, ),),
              ),
              Tab(
                child: Text('Past',style: styleBold.copyWith(fontSize: 20,),),
              ),
            ],
          ),
        ),
        body:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TabBarView(
            children: <Widget>[
              SizedBox(

                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      childAspectRatio: .72

                    ),
                    itemCount: 9,
                  padding: EdgeInsets.only(left: 1, right: 1, top: 9, bottom: 16),
                   // physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 5,right: 5, top: 5, bottom: 5),
                        child: CustomInvitationContainer(),
                      );
                    },

              ),
                          ),
              SizedBox(
                width: double.infinity,
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      childAspectRatio: .9

                    ),
                    itemCount: 9,
                  padding: EdgeInsets.only(left: 1, right: 1, top: 9, bottom: 16),
                   // physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 5,right: 5, top: 5, bottom: 5),
                        child: CustomCalendarCategoryContainer(),
                      );
                    },

              ),
                          ),
              SizedBox(
                width: double.infinity,
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      childAspectRatio: .72

                    ),
                    itemCount: 9,
                  padding: EdgeInsets.only(left: 1, right: 1, top: 9, bottom: 16),
                   // physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 5,right: 5, top: 5, bottom: 5),
                        child: CustomInvitationContainer(),
                      );
                    },

              ),
                          ),
            ],
          ),
        ),
      ),
    );
  }
}
