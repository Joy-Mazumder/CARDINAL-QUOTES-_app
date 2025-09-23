import 'package:cardinal_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TSectionHeading extends StatelessWidget {
  const TSectionHeading({
    super.key,
    this.textColor,
    this.showActionButton = true,
    required this.title,
    this.buttonTitle = 'See All',
    this.onPressed,
  });

  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// Title
          Text(
            title,
            style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Raleway",
                  fontWeight: FontWeight.w500,
                  color: textColor ?? MyColors.bgContainer,
                ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
      
          /// "See All" Button
          if (showActionButton)
            TextButton(
              onPressed: onPressed,
              style: TextButton.styleFrom(
                foregroundColor: textColor ?? MyColors.bgContainer,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    buttonTitle,
                    style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 14,color: MyColors.bgContainer, fontFamily: "Raleway"),
                  ),
                  const SizedBox(width: 4),
                  const Icon(Iconsax.arrow_right_3, size: 12, color: MyColors.bgContainer),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
