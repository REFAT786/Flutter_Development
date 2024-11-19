import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../../utils/dimensions.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.title,
    required this.hintText,
    required this.isSuffix,
  });

  final String hintText, title;
  final bool isSuffix;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          bottom: Dimensions.paddingSizeFive, top: Dimensions.paddingSizeFive),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title),
          Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColor.whiteThree,
                borderRadius: BorderRadius.circular(Dimensions.radiusFifteen),
              ),
              child: TextField(
                obscureText: passwordVisible,
                cursorColor: AppColor.black,

                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: Dimensions.paddingSizeTwenty,
                      horizontal: Dimensions.paddingSizeTwenty),
                  suffixIcon: widget.isSuffix
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              passwordVisible = !passwordVisible;
                            });
                          },
                          icon: passwordVisible
                              ? const Icon(Icons.visibility_off,
                                  color: Colors.grey, size: 20)
                              : const Icon(Icons.visibility,
                                  color: Colors.grey, size: 20),
                        )
                      : null,
                  border: InputBorder.none,
                  hintText: widget.hintText,
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 15),
                ),
              )),
        ],
      ),
    );
  }
}
