import 'package:flutter/material.dart';
import 'package:food_delivery_app_ui/utils/dimensions.dart';

import 'custom_card.dart';
import 'custom_container_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.onTapButton,
    required this.leadingBGColor,
    required this.leadingIcon,
    required this.leadingIconColor,
    required this.title,
    this.subTitle,
    this.subTitleIcon,
    this.number,
    required this.titleColor,
    this.suffixBGColor,
    this.suffixIcon,
    this.suffixIconColor,
    this.onTapCard,
    this.actionText,
    this.actiontextColor,
  });

  final Color leadingBGColor, leadingIconColor, titleColor;
  final Color? actiontextColor, suffixBGColor, suffixIconColor;
  final IconData leadingIcon;
  final IconData? subTitleIcon, suffixIcon;
  final String title;
  final String? subTitle, actionText;
  final int? number;

  final VoidCallback? onTapCard;
  final VoidCallback onTapButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onTapButton,
          child: CustomContainerIcon(
            bgColor: leadingBGColor,
            icon: leadingIcon,
            iconColor: leadingIconColor,
          ),
        ),
        const SizedBox(width: Dimensions.marginSizeTen),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(color: titleColor, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                if (subTitle != null) Text(subTitle!),
                if (subTitleIcon != null) Icon(subTitleIcon),
              ],
            ),
          ],
        ),
        const Spacer(),
        if (suffixBGColor != null)
          InkWell(
            onTap: onTapCard,
            child: CustomCard(
              number: number,
              suffixBGColor: suffixBGColor,
              suffixIcon: suffixIcon,
              suffixIconColor: suffixIconColor,
            ),
          ),
        if (actionText != null)
          InkWell(
            onTap: onTapCard,
            child: Text(
              actionText!,
              style: TextStyle(color: actiontextColor),
            ),
          ),
      ],
    );
  }
}
