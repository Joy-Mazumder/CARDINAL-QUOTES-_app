import 'package:cardinal_app/features/reuseable_widgets/sound_screen_music_card.dart';
import 'package:cardinal_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SoulScreen extends StatelessWidget {
  const SoulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            children: [
              // header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          // Get.back();
                          // Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_forward,
                          color: MyColors.bgContainer,
                        ),
                      ),
                      const SizedBox(width: 6),
                      const Text(
                        "Soul Check-In",
                        style: TextStyle(
                          fontFamily: "Railway-SemiBold",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: MyColors.bgContainer,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 16),

              MusicWiperCard(
                outerBOXimage: "assets/images/memry_1.png",
                showInnerBox: false,
                showBelowCardASiTis: false,
                onTap: () {},
              ),
              MusicWiperBelowMusicInfoCard(
                showTitles: false,
                isRemovable: false,
              ),

              MusicWiperCard(
                outerBOXimage: "assets/images/memry_2.png",
                showInnerBox: false,
                showBelowCardASiTis: false,
                showInnerBoxText: true,
                onTap: () {},
              ),
              MusicWiperBelowMusicInfoCard(showTitles: false),

              MusicWiperCard(
                outerBOXimage: "assets/images/memry_3.png",
                showInnerBox: false,
                showBelowCardASiTis: false,
                onTap: () {},
              ),
              MusicWiperBelowMusicInfoCard(showTitles: false),
            ],
          ),
        ),
      ),
    );
  }
}
