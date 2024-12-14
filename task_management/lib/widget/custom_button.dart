import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
   CustomButton({super.key, this.buttonText});
  String? buttonText;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Center(
          child: Text(
            "$buttonText",
            style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );
  }
}
