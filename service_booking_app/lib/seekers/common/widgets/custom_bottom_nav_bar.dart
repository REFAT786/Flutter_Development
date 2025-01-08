import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:service_booking_app/seekers/features/chat_screen/screen/chat_screen.dart';
import 'package:service_booking_app/seekers/features/event_screen/screen/event_screen.dart';
import 'package:service_booking_app/seekers/features/explore_screen/screen/explore_screen.dart';
import 'package:service_booking_app/seekers/features/home/screen/home_screen.dart';
import 'package:service_booking_app/seekers/features/invitation_screen/screen/invitation_screen.dart';
import 'package:service_booking_app/seekers/features/seeker_profile/screen/profile_screen.dart';


class CustomBottomNavBar extends StatelessWidget {
   CustomBottomNavBar({super.key});

  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

   List<Widget> _buildScreens() {
     return [
       HomeScreen(),
       ExploreScreen(),
       EventScreen(),
       ChatScreen(),
       ProfileScreen()
     ];
   }

   List<PersistentBottomNavBarItem> _navBarsItems() {
     return [
       PersistentBottomNavBarItem(
         icon: Icon(Icons.home),
         title: "Home",
         activeColorPrimary: Colors.white,
         inactiveColorPrimary: Colors.white70,
       ),
       PersistentBottomNavBarItem(
         icon: Icon(Icons.search),
         title: "Explore",
         activeColorPrimary: Colors.white,
         inactiveColorPrimary: Colors.white70,
       ),
       PersistentBottomNavBarItem(
         icon: Icon(Icons.event),
         title: "Event",
         activeColorPrimary: Colors.white,
         inactiveColorPrimary: Colors.white70,
       ),
       PersistentBottomNavBarItem(
         icon: Icon(Icons.chat),
         title: "Chat",
         activeColorPrimary: Colors.white,
         inactiveColorPrimary: Colors.white70,
       ),
       PersistentBottomNavBarItem(
         icon: Icon(Icons.person),
         title: "Profile",
         activeColorPrimary: Colors.white,
         inactiveColorPrimary: Colors.white70,
       ),
     ];
   }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      navBarStyle: NavBarStyle.style3, // Style 3
      backgroundColor: Colors.blue,

    );
  }
}
