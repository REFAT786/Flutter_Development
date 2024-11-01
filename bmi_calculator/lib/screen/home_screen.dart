import 'package:flutter/material.dart';
import 'package:bmi_calculator/custom_widget/custom_age_weight_profile.dart';
import 'package:bmi_calculator/screen/result_screen.dart';
import 'package:bmi_calculator/custom_widget/custom_gender.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double height = 150, weight = 50, age = 20;
  bool isMaleSelected = false;
  bool isFemaleSelected = false;

  late double result;
  late String gender, status;

  void genderSelect() {
    if (isMaleSelected == true) {
      gender = "Sir";
    } else if (isFemaleSelected == true) {
      gender = "Ma'am";
    } else {
      gender = "Gender not selected";
    }
  }

  void calculateBmi() {
    setState(() {
      double calHeight = (height / 100) * (height / 100);
      result = weight / calHeight;
    });
  }

  void statusBmi() {
    setState(() {
      if (result < 16) {
        status = "Severe Thinness";
      } else if (result >= 16 && result <= 17) {
        status = "Moderate Thinness";
      } else if (result > 17 && result <= 18.5) {
        status = "Mild Thinness";
      } else if (result > 18.5 && result <= 25) {
        status = "Normal";
      } else if (result > 25 && result <= 30) {
        status = "Overweight";
      } else if (result > 30 && result <= 35) {
        status = "Obese Class I";
      } else if (result > 35 && result <= 40) {
        status = "Obese Class II";
      } else if (result > 40) {
        status = "Obese Class III (Red Zone)";
      } else {
        status = "No status available";
      }
    });
  }

  void updateWeight(double newWeight) {
    setState(() {
      weight = newWeight;
    });
  }

  void updateAge(double newAge) {
    setState(() {
      age = newAge;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "BMI CALCULATOR",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: const Color(0xff191D20),
      ),
      body: Container(
        color: const Color(0xff191D20),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              flex: 10,
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isMaleSelected = true;
                          isFemaleSelected = false;
                        });
                      },
                      child: CustomGender(
                        genderIcon: Icons.male,
                        genderText: "Male",
                        isSelected: isMaleSelected,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    flex: 5,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isMaleSelected = false;
                          isFemaleSelected = true;
                        });
                      },
                      child: CustomGender(
                        genderIcon: Icons.female,
                        genderText: "Female",
                        isSelected: isFemaleSelected,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              flex: 9,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff272A2F),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Height",
                      style: TextStyle(color: Colors.white),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          height.toStringAsFixed(2),
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                        const SizedBox(width: 2),
                        const Text(
                          "cm",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Slider(
                      value: height,
                      min: 100,
                      max: 220,
                      activeColor: const Color(0xffEFA931),
                      inactiveColor: Colors.white,
                      onChanged: (value) {
                        setState(() {
                          height = value;
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              flex: 10,
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomAgeWeightProfile(
                      titleName: 'Weight',
                      intNumber: weight,
                      unit: 'kg',
                      onValueChanged: updateWeight, // Pass the callback
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    flex: 5,
                    child: CustomAgeWeightProfile(
                      titleName: 'Age',
                      intNumber: age,
                      unit: '',
                      onValueChanged: updateAge, // Pass the callback
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              flex: 4,
              child: SizedBox(
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () {
                    genderSelect();
                    calculateBmi();
                    statusBmi();
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ResultScreen(
                        gender: gender,
                        age: age,
                        mbiResult: result,
                        mbiStatus: status,
                      ),
                    ));
                  },
                  color: const Color(0xffEFA931),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text(
                    "Calculate Your BMI",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
