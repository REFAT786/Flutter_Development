import 'package:flutter/material.dart';

class CustomHourlyForecastWidget extends StatelessWidget {
  const CustomHourlyForecastWidget({
    super.key, required this.temperature, required this.cloudImage, required this.cloudText,
  });

  final double temperature;
  final String cloudImage;
  final String cloudText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text('$temperature°', style: const TextStyle(color: Colors.white),),
          const SizedBox(height: 10,),
          Image.network(cloudImage,width: 50,height: 50,),
          Text(cloudText, style: const TextStyle(color: Colors.white))
        ],
      ),
    );
  }
}
