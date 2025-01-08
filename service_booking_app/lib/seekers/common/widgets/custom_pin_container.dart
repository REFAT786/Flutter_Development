import 'package:flutter/material.dart';

class CustomPinContainer extends StatelessWidget {
  const CustomPinContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 60,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),

          contentPadding: EdgeInsets.all(10),
        ),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        //76766maxLength: 1,
        onChanged: (value) {
          if (value.isNotEmpty) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}
