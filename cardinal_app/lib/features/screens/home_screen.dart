// import 'package:cardinal_app/utils/constants/colors.dart';
import 'package:cardinal_app/features/widgets/custom_drawer.dart';
import 'package:cardinal_app/features/widgets/grid_card_home.dart';
import 'package:cardinal_app/features/widgets/hometop_scroll.dart';
import 'package:cardinal_app/utils/common/widgets/scroll_x_axis_image.dart';
import 'package:cardinal_app/utils/common/widgets/section_heading.dart';
import 'package:cardinal_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    // final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: CustomDrawer(),
      // appBar: AppBar(
      //   backgroundColor: MyColors.primary,
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header part
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 54.0),
              child: Row(
                children: [
                  Builder(
                    builder: (context) {
                      return IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        icon: Icon(Icons.menu, color: MyColors.bgContainer),
                      );
                    },
                  ),
                  HometopHorizontalScroll(),
                ],
              ),
            ),

            // next 4 rows
            HomeGridCard(),

            //  horizontal scrollable image + section heading
            TSectionHeading(title: "Featured Wallpapers", onPressed: () {}),
            THorizontalImageList(
              images: [
                "assets/images/fwall_1.png",
                "assets/images/fwall_2.png",
                "assets/images/fwall_3.png",
              ],
              onTap: () {},
            ),

            TSectionHeading(title: "Featured Quotes", onPressed: () {}),
            THorizontalImageList(
              images: [
                "assets/images/fquote_1.png",
                "assets/images/fquote_2.png",
                "assets/images/fquote_3.png",
              ],
              onTap: () {},
            ),

            TSectionHeading(title: "Featured Memorial Cards", onPressed: () {}),
            THorizontalImageList(
              images: [
                "assets/images/fmemc_1.png",
                "assets/images/fmemc_2.png",
                "assets/images/fmemc_3.png",
              ],
              onTap: () {},
            ),

            TSectionHeading(
              title: "Announcements",
              onPressed: () {},
            ), //home_announce.png
            SizedBox(
              width: 340,
              height: 132,
              child: Image.asset("assets/images/home_announce.png"),
            ),
            SizedBox(height: screenHeight * 0.03),
          ],
        ),
      ),
    );
  }
}
