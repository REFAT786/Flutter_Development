import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_booking_app/seekers/features/auth/fill_profile/screen/fill_profile_screen.dart';

class ChooseInterestScreen extends StatefulWidget {
  const ChooseInterestScreen({super.key});

  @override
  State<ChooseInterestScreen> createState() => _ChooseInterestScreenState();
}

class _ChooseInterestScreenState extends State<ChooseInterestScreen> {
  // Sample list of interests with initial selection state
  final List<Map<String, dynamic>> interests = [
    {"name": "Hiking", "isSelected": true},
    {"name": "Dialog", "isSelected": false},
    {"name": "Coffee", "isSelected": false},
    {"name": "Reading", "isSelected": true},
    {"name": "Travel", "isSelected": false},
    {"name": "Movies", "isSelected": false},
    {"name": "Music", "isSelected": false},
    {"name": "Art", "isSelected": false},
    {"name": "Cooking", "isSelected": true},
    {"name": "Yoga", "isSelected": false},
    {"name": "Photography", "isSelected": false},
    {"name": "Gardening", "isSelected": false},
    {"name": "Running", "isSelected": false},
    {"name": "Swimming", "isSelected": false},
    {"name": "Cycling", "isSelected": false},
    {"name": "Rock climbing", "isSelected": false},
    {"name": "Sushi tasting", "isSelected": false},
    {"name": "Wildlife photography", "isSelected": true},
    {"name": "Meditation", "isSelected": true},
    {"name": "Street photography", "isSelected": true},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Your Interest'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Interests
            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: interests.asMap().entries.map((entry) {
                    final index = entry.key;
                    final interest = entry.value;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          interests[index]["isSelected"] =
                          !interests[index]["isSelected"];
                        });
                      },
                      child: InterestChip(
                        name: interest["name"],
                        isSelected: interest["isSelected"],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    // Handle Skip
                  },
                  child: const Text(
                    "Skip",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.to(FillProfileScreen());
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 12),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class InterestChip extends StatelessWidget {
  final String name;
  final bool isSelected;

  const InterestChip({
    super.key,
    required this.name,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.white,
        border: Border.all(
          color: isSelected ? Colors.blue : Colors.grey,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        name,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
