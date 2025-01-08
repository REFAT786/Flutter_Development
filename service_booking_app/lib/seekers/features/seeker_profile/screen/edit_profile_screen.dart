import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:service_booking_app/seekers/common/widgets/custom_interest_field.dart';
import 'package:service_booking_app/seekers/utils/styles.dart';
import '../../../common/widgets/custom_image_decoration.dart';
import '../../../utils/app_color.dart';
import '../../../utils/images.dart';

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String? _selectedGender;
  String? selectedCountry;
  final List<String> _genders = ['Male', 'Female', 'Other'];

  final List<Map<String, dynamic>> interests = [
    {"name": "Hiking", "icon": Icons.terrain, "isSelected": true},
    {"name": "Dining", "icon": Icons.restaurant, "isSelected": false},
    {"name": "Coffee", "icon": Icons.local_cafe, "isSelected": false},
    {"name": "Reading", "icon": Icons.menu_book, "isSelected": true},
    {"name": "Travel", "icon": Icons.directions_walk, "isSelected": false},
    {"name": "Movies", "icon": Icons.movie, "isSelected": false},
    {"name": "Music", "icon": Icons.music_note, "isSelected": false},
    {"name": "Art", "icon": Icons.brush, "isSelected": false},
    {"name": "Cooking", "icon": Icons.restaurant_menu, "isSelected": true},
    {"name": "Yoga", "icon": Icons.self_improvement, "isSelected": false},
    {"name": "Photography", "icon": Icons.camera_alt, "isSelected": false},
    {"name": "Gardening", "icon": Icons.grass, "isSelected": false},
  ];

  void _showAddInterestDialog() {
    final TextEditingController _controller = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Add New Interest"),
          content: TextField(
            controller: _controller,
            decoration: const InputDecoration(hintText: "Enter interest name"),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                String newInterest = _controller.text.trim();
                if (newInterest.isEmpty) {
                  // Show a warning if the input is empty
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Interest name cannot be empty")),
                  );
                  return;
                }

                setState(() {
                  interests.insert(interests.length - 1, {
                    "name": newInterest,
                    "icon": Icons.star, // You can allow users to choose an icon
                    "isSelected": false,
                  });
                });

                Navigator.of(context).pop();
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text("Edit Profile"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(Images.serviceShortPhoto)),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: const Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text("Name"),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.secondary,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "mail@gmail.com",
                        style: styleSemiBold,
                      ),
                      const Spacer(),
                      const Icon(Icons.keyboard_arrow_down_rounded),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                IntlPhoneField(
                  decoration: InputDecoration(
                    hintText: 'Phone Number',
                    hintStyle: styleSemiBold,
                    fillColor: AppColors.secondary,
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  initialCountryCode: 'US',
                  onChanged: (phone) {
                    print(phone.completeNumber);
                  },
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: _selectedGender,
                  items: _genders.map((String gender) {
                    return DropdownMenuItem<String>(
                      value: gender,
                      child: Text(gender),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedGender = newValue;
                    });
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.secondary,
                    hintText: "Gender",
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text("Change Password", style: styleBold),
                const SizedBox(height: 5),
                TextField(
                  decoration: InputDecoration(
                    fillColor: AppColors.secondary,
                    filled: true,
                    hintText: "Enter Current Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                TextField(
                  decoration: InputDecoration(
                    fillColor: AppColors.secondary,
                    filled: true,
                    hintText: "Enter New Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                TextField(
                  decoration: InputDecoration(
                    fillColor: AppColors.secondary,
                    filled: true,
                    hintText: "Confirm New Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text("My Availability", style: styleBold),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.secondary,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "10 AM",
                        style: styleSemiBold,
                      ),
                      Text(
                        " - ",
                        style: styleSemiBold,
                      ),
                      Text(
                        "10 PM",
                        style: styleSemiBold,
                      ),
                      const Spacer(),
                      const Icon(Icons.punch_clock),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Text("Availability Preference", style: styleBold),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    if (interests.any((interest) => interest["name"] == "+Add")) {
                      _showAddInterestDialog();
                    } else {
                      setState(() {
                        interests.firstWhere((interest) => interest["name"] == "+Add")["isSelected"] = !interests.firstWhere((interest) => interest["name"] == "+Add")["isSelected"];
                      });
                    }
                  },
                  child: InterestChip(
                    name: "Add",
                    icon: Icons.add,
                    isSelected: false,
                  ),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  alignment: WrapAlignment.start,
                  children: interests.map((interest) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            interest["isSelected"] = !interest["isSelected"];
                          });
                        },
                        child: InterestChip(
                          name: interest["name"],
                          icon: interest["icon"],
                          isSelected: interest["isSelected"],
                        ),
                      ),
                    );
                  }).toList(),
                ),

                const SizedBox(height: 10),
                Text("My Interests", style: styleBold),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    if (interests.any((interest) => interest["name"] == "+Add")) {
                      _showAddInterestDialog();
                    } else {
                      setState(() {
                        interests.firstWhere((interest) => interest["name"] == "+Add")["isSelected"] = !interests.firstWhere((interest) => interest["name"] == "+Add")["isSelected"];
                      });
                    }
                  },
                  child: InterestChip(
                    name: "Add",
                    icon: Icons.add,
                    isSelected: false,
                  ),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  alignment: WrapAlignment.start,
                  children: interests.map((interest) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            interest["isSelected"] = !interest["isSelected"];
                          });
                        },
                        child: InterestChip(
                          name: interest["name"],
                          icon: interest["icon"],
                          isSelected: interest["isSelected"],
                        ),
                      ),
                    );
                  }).toList(),
                ),

                const SizedBox(height: 10),
                Text("My Skills", style: styleBold),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    if (interests.any((interest) => interest["name"] == "+Add")) {
                      _showAddInterestDialog();
                    } else {
                      setState(() {
                        interests.firstWhere((interest) => interest["name"] == "+Add")["isSelected"] = !interests.firstWhere((interest) => interest["name"] == "+Add")["isSelected"];
                      });
                    }
                  },
                  child: InterestChip(
                    name: "Add",
                    icon: Icons.add,
                    isSelected: false,
                  ),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  alignment: WrapAlignment.start,
                  children: interests.map((interest) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            interest["isSelected"] = !interest["isSelected"];
                          });
                        },
                        child: InterestChip(
                          name: interest["name"],
                          icon: interest["icon"],
                          isSelected: interest["isSelected"],
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 10),
                Text("Photos", style: styleBold),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: .87
                    ),
                    itemCount: 7,
                    padding: EdgeInsets.all(1),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: CustomImageDecoration(imageName: Images.serviceShortPhoto),
                      );
                    },
                  ),
                ),


              ],
            )
          ],
        ),
      ),
    );
  }
}

class InterestChip extends StatelessWidget {
  final String name;
  final IconData icon;
  final bool isSelected;

  const InterestChip({
    Key? key,
    required this.name,
    required this.icon,
    required this.isSelected,
  }) : super(key: key);

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
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 16,
            color: isSelected ? Colors.white : Colors.black,
          ),
          const SizedBox(width: 6),
          Text(
            name,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
