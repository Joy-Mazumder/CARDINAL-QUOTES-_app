import 'package:cardinal_app/features/from_grid_to_screens/meditation_screen.dart';
import 'package:cardinal_app/features/from_grid_to_screens/memorial_card.dart';
import 'package:cardinal_app/features/from_grid_to_screens/save_screen.dart';
import 'package:cardinal_app/features/screens/todo_screen.dart';
import 'package:cardinal_app/utils/common/widgets/grid_lay.dart';
import 'package:cardinal_app/utils/constants/all_list/home_menu_lists.dart';
import 'package:cardinal_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class HomeGridCard extends StatelessWidget {
  const HomeGridCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          TGridLayout(
      itemCount: menuItems.length,
      crossAxisCount: 3,
      mainAxisExtent: 100,
      itemBuilder: (_, index) {
        final item = menuItems[index];
        return GestureDetector(
          onTap: () { 
            if(index == 4) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MeditationScreen()));
            }else if(index == 11) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => TodoScreen()));   
          }else if(index == 12) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MemorialCard()));   
          }else if(index == 13) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SaveScreen()));   
          }
          
          },
          child: Container(
            height: 46,
            width: 80,
            decoration: BoxDecoration(
              color: MyColors.bgContainer,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(item["icon"], color: MyColors.ogColor, size: 24),
                // const SizedBox(height: 6),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    item["title"],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: MyColors.ogColor,
                      fontFamily: "Raleway",
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
          })
        ],
      ),
    );
  }
}

