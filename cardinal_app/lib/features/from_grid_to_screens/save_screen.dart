import 'package:cardinal_app/features/controllers/save_controller.dart';
import 'package:cardinal_app/features/reuseable_widgets/sound_screen_music_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:cardinal_app/utils/constants/colors.dart';

class SaveScreen extends StatelessWidget {
  SaveScreen({super.key});

  final SaveController controller = Get.put(SaveController());

  final tabs = ["Audios", "Quotes", "Wallpapers", "Docs"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Arrow + Text
            Padding(
              padding: const EdgeInsets.all(30),
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Row(
                  children: const [
                    Icon(Iconsax.arrow_left, color: MyColors.clsWhite),
                    SizedBox(width: 6),
                    Text(
                      "Save",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Raleway-SemiBold",
                        color: MyColors.clsWhite,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// Horizontal Tabs
            SizedBox(
              height: 46,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: tabs.length,
                separatorBuilder: (_, __) => const SizedBox(width: 10),
                itemBuilder: (context, index) {
                  return Obx(() {
                    final isSelected = controller.selectedTab.value == index;
                    return GestureDetector(
                      onTap: () => controller.changeTab(index),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? MyColors.bgContainer
                              : Colors.transparent,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              index == 0
                                  ? Iconsax.musicnote
                                  : index == 1
                                  ? Iconsax.quote_down
                                  : Iconsax.image,
                              size: 16,
                              color: isSelected
                                  ? MyColors.ogColor
                                  : Colors.white,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              tabs[index],
                              style: TextStyle(
                                fontFamily: "Raleway",
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: isSelected
                                    ? MyColors.ogColor
                                    : Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
                },
              ),
            ),

            const SizedBox(height: 20),

            /// Dynamic Content
            Expanded(
              child: Obx(() {
                switch (controller.selectedTab.value) {
                  case 0:
                    return const Center(
                      child: Column(
                        children: [
                          MusicWiperCard(
                            showInnerBox: true,
                            showBelowCardASiTis: false,
                          ),
                          MusicWiperBelowMusicInfoCard(isRemovable: true),
                        ],
                      ),
                    );
                  case 1:
                    return const Center(
                      child: Column(
                        children: [
                          MusicWiperCard(
                            showInnerBoxText: false,
                            showBelowCardASiTis: false,
                            outerBOXimage: "assets/images/memry_1.png",
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: MusicWiperBelowMusicInfoCard(
                              showTitles: false,
                              isRemovable: false,
                            ),
                          ),
                        ],
                      ),
                    );
                  default:
                    return const Center(
                      child: Text(
                        "No content available",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
