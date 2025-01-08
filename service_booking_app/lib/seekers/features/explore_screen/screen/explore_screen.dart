import 'package:flutter/material.dart';
import 'package:service_booking_app/seekers/common/widgets/custom_interest_field.dart';
import 'package:service_booking_app/seekers/common/widgets/custom_search_box.dart';

import '../../../utils/images.dart';

class ExploreScreen extends StatefulWidget {
  ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final TextEditingController searchController = TextEditingController();

  String selectedOption = "Option 1";
 // Default selected option
  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Select an Option"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile<String>(
                title: const Text("Relevance"),
                value: "Relevance",
                groupValue: selectedOption,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value!;
                  });
                  Navigator.pop(context); // Close dialog after selection
                },
              ),
              RadioListTile<String>(
                title: const Text("Ratings"),
                value: "Ratings",
                groupValue: selectedOption,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value!;
                  });
                  Navigator.pop(context);
                },
              ),
              RadioListTile<String>(
                title: const Text("Unselected"),
                value: "Unselected",
                groupValue: selectedOption,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value!;
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding:  EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // AppBar Title
             Text(
              "Explore",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Search Bar with Filter Button
            Row (
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomSearchBox(
                    hintText: "Search for events or companions",
                    controller: searchController,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _showFilterDialog(context);
                  },
                  icon: const Icon(Icons.filter_alt, size: 30),
                ),
              ],
            ),
            SizedBox(height: 10,),
            SizedBox(
              height: 50,
              child: ListView.builder(
                itemCount: 7,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(1),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5),
                      child: CustomInterestField(name: "Coffee", icon: Icons.coffee),
                    );
                  },
              ),
            ),
            SizedBox(height: 10,),
            Image.asset(Images.mapImage)

          ],
        ),
      ),
    );
  }
}
