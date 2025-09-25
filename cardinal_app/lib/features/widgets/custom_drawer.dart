import 'package:cardinal_app/features/screens/signup_login_screen.dart';
import 'package:cardinal_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Padding(
      padding: EdgeInsets.only(
        left: width * 0.05,
        top: height * 0.05,
        right: width * 0.2,
        bottom: height * 0.02,
      ),
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: MyColors.bgContainer,
          borderRadius: BorderRadius.circular(20),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              vertical: height * 0.01,
              horizontal: width * 0.03,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.15,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      /// Close Button
                      Positioned(
                        top: 0,
                        right: 0,
                        child: IconButton(
                          icon: const Icon(Icons.close, color: MyColors.ogColor),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ),

                      /// Quote text
                      Positioned(
                        top: height * 0.04,
                        left: 0,
                        right: -width * 0.05,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '"Peace comes from within.\n    Do not seek it without."',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: MyColors.ogColor,
                                fontSize: width * 0.05, // responsive
                                fontFamily: "Railway-Medium",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: height * 0.005),
                            Center(
                              child: Text(
                                "Buddha",
                                style: TextStyle(
                                  color: MyColors.ogColor,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Railway-Bold",
                                  fontSize: width * 0.04, // responsive
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      /// First bird
                      Positioned(
                        top: height * 0.06,
                        right: width * 0.5,
                        left: -width * 0.01,
                        child: Image.asset(
                          "assets/images/bird_1.png",
                          height: height * 0.18,
                          width: width * 0.4,
                        ),
                      ),

                      /// Second bird
                      Positioned(
                        top: height * 0.08,
                        right: -width * 0.05,
                        left: width * 0.36,
                        child: Image.asset(
                          "assets/images/bird_2.png",
                          height: height * 0.2,
                          width: width * 0.3,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: height * 0.05),

                // Drawer Items (unchanged)
                _drawerItem(Icons.explore_outlined, "Explore", () {}),
                _drawerItem(Icons.local_fire_department_outlined, "Popular", () {}),
                _drawerItem(Icons.new_releases, "Latest", () {}),
                _drawerItem(Iconsax.sound, "Cardinal Sound", () {}),
                _drawerItem(Icons.wallpaper, "Wallpaper", () {}),
                _drawerItem(Icons.surround_sound_outlined, "Natural Sound", () {}),
                _drawerItem(Icons.bed, "Sleeping", () {}),
                _drawerItem(Icons.self_improvement, "Meditation", () {}),
                _drawerItem(Icons.air, "Breathing Exercise", () {}),
                _drawerItem(Icons.audiotrack, "Meditational Audios", () {}),
                _drawerItem(Icons.timer, "Short Meditation", () {}),
                _drawerItem(Icons.format_quote, "Top Quotes", () {}),
                _drawerItem(Icons.favorite_border, "Soul Check-In", () {}),
                _drawerItem(Icons.book, "Sacred Journals", () {}),
                _drawerItem(Icons.note, "Medicine Note", () {}),
                _drawerItem(Icons.card_giftcard, "Memorial Card", () {}),
                _drawerItem(Icons.bookmark_border, "Save", () {}),

                SizedBox(height: height * 0.015),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  SignUpLoginScreen()),
                    );
                  },
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Log Out",
                          style: TextStyle(
                            fontSize: width * 0.054,
                            fontFamily: "Railway-Semibold",
                            color: MyColors.ogColor,
                          ),
                        ),
                        SizedBox(width: width * 0.04),
                        const Icon(Icons.logout),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Reusable item widget
  Widget _drawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: MyColors.ogColor),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
      onTap: onTap,
    );
  }
}
