import 'package:flutter/material.dart';

class CustomAgeWeightProfile extends StatefulWidget {
  const CustomAgeWeightProfile({
    super.key,
    required this.titleName,
    required this.intNumber,
    required this.unit,
    required this.onValueChanged, // Add the callback here
  });

  final String titleName;
  final String unit;
  final double intNumber;
  final ValueChanged<double> onValueChanged; // Define a callback type

  @override
  State<CustomAgeWeightProfile> createState() => _CustomAgeWeightProfileState();
}

class _CustomAgeWeightProfileState extends State<CustomAgeWeightProfile> {
  late double number;

  @override
  void initState() {
    super.initState();
    number = widget.intNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Text(widget.titleName, style: const TextStyle(color: Colors.white)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                number.toStringAsFixed(0),
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              const SizedBox(width: 2),
              Text(widget.unit, style: const TextStyle(color: Colors.white))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    number = (number > 0) ? number - 1 : 0; // Prevent negative values
                    widget.onValueChanged(number); // Call the callback with the new number
                  });
                },
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(17),
                  backgroundColor: const Color(0xff525355),
                ),
                child: const Icon(Icons.remove, color: Color(0xffEFA931)),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    number++; // Increment the number
                    widget.onValueChanged(number); // Call the callback with the new number
                  });
                },
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(17),
                  backgroundColor: const Color(0xff525355),
                ),
                child: const Icon(Icons.add, color: Color(0xffEFA931)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
