import 'package:cardinal_app/features/screens/signup_login_screen.dart';
import 'package:cardinal_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, top: 40, right: 142, bottom: 20),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.78,

        decoration: BoxDecoration(
          color: MyColors.bgContainer,
          borderRadius: BorderRadius.circular(20),
        ), // background
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 120,

                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      /// Quote text
                      /// 
                      Positioned(
                        top: 0,
                        right: 0,
                        child: IconButton(
                          icon: const Icon(Icons.close, color: MyColors.ogColor),
                          onPressed: () {
                            Navigator.of(context).pop(); 
                          },
                        ),
                      ),
                      
                      Positioned(
                        top: 32,
                        left: 0,
                        right: -19, 
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              '"Peace comes from within.\n    Do not seek it without."',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: MyColors.ogColor,
                                fontSize: 15,
                                fontFamily: "Railway-Medium",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 4),
                            Center(
                              child: Text(
                                "Buddha",
                                style: TextStyle(
                                  color: MyColors.ogColor,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Railway-Bold",
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      /// First bird 
                      Positioned(
                        top: 54,
                        right: 110,
                        left: -15,
                        child: Image.asset(
                          "assets/images/bird_1.png",
                          height: 90,
                          width: 110,
                        ),
                      ),

                      /// Second bird 
                      Positioned(
                        top: 46,
                        right: -10,
                        left: 90,
                        child: Image.asset(
                          "assets/images/bird_2.png",
                          height: 156,
                          width: 124,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

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

                SizedBox(height: 10,),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  SignUpLoginScreen()));
                  },
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Log Out",style: TextStyle(fontSize: 15,fontFamily: "Railway-Semibold",color: MyColors.ogColor),),
                        SizedBox(width: 10,),
                        Icon(Icons.logout),
                      ]
                      
                      
                    ),
                  ),
                ),
                SizedBox(height: 20,),

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
      title: Text(title, style: const TextStyle(fontSize: 16)),
      onTap: onTap,
    );
  }
}
