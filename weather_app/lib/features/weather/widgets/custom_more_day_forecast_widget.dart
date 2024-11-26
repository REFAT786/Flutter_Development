import 'package:flutter/material.dart';

class CustomMoreDayForecastWidget extends StatelessWidget {
  const CustomMoreDayForecastWidget({super.key, required this.day, required this.cloudImage, required this.highTemp, required this.lowTemp});

  final String day;
  final String cloudImage;
  final double highTemp, lowTemp;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Container(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 7, bottom: 7),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
          color: Color(0xff0d1d2a),
        ),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(day, style: const TextStyle(color: Colors.white),),
            const Spacer(),
            Image.network(cloudImage,width: 40,height: 40,),
            //const SizedBox(width: 30,),
            Text("${highTemp.toInt()}°/${lowTemp.toInt()}°", style: const TextStyle(color: Colors.white),)
          ],
        ),
      ),
    );
  }
}
