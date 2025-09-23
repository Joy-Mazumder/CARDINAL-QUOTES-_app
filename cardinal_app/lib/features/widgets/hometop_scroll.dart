import 'package:cardinal_app/utils/constants/all_list/home_top_lists.dart';
import 'package:cardinal_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class HometopHorizontalScroll extends StatelessWidget {
  const HometopHorizontalScroll({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: homeTopList.map((item) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                padding: const EdgeInsets.only(left: 12,right: 10),
                height: 53,
                
                decoration: BoxDecoration(
                  color: Color(0xffFEF0D6),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: MyColors.ogColor),
    
                ),
                child: Row(
                  children: [Image.asset(
            item.imageUrl,
            width: 24,
            height: 24,
          ),
          const SizedBox(width: 2), 
          Text(
            item.title,
            style: const TextStyle(
              color: MyColors.ogColor,
              fontSize: 15,
              fontWeight: FontWeight.w500,
              fontFamily: "Raleway", 
            ),
          ),],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
