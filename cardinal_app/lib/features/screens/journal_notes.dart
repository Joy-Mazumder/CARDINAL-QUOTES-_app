import 'package:cardinal_app/features/controllers/journal_detail_controller.dart';
import 'package:cardinal_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class JournalDetailScreen extends StatelessWidget {
  const JournalDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(JournalDetailController());
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFFDF4E3),
      body: SafeArea(
        child: Column(
          children: [
            /// TOP IMAGE + HEADER
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: size.height * 0.38,
                  child: Image.asset(
                    "assets/images/bird_house.png",
                    fit: BoxFit.cover,
                  ),
                ),

                /// Header
                Positioned(
                  top: 22,
                  left: 12,
                  right: 12,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: const Icon(Iconsax.arrow_left,
                            color: MyColors.ogColor, size: 28),
                      ),
                      const Icon(Icons.menu, color: MyColors.ogColor, size: 28),
                    ],
                  ),
                ),

                /// Editable Title & Note
                Positioned(
                  left: 20,
                  top: size.height * 0.14,
                  right: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Title
                      Obx(() {
                        return GestureDetector(
                          onTap: () => controller.isTitleEditing.value = true,
                          child: controller.isTitleEditing.value
                              ? Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(vertical: 4),
                                  child: TextField(
                                    controller: controller.titleController,
                                    autofocus: true,
                                    style: const TextStyle(
                                      fontFamily: "Railway-Bold",
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: MyColors.ogColor,
                                    ),
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      isCollapsed: true,
                                      contentPadding: EdgeInsets.zero,
                                    ),
                                    onSubmitted: (_) => controller.saveTitle(),
                                  ),
                                )
                              : Text(
                                  controller.titleController.text,
                                  style: const TextStyle(
                                    fontFamily: "Railway",
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: MyColors.ogColor,
                                  ),
                                ),
                        );
                      }),

                      const SizedBox(height: 6),

                      /// Note
                      Obx(() {
                        return GestureDetector(
                          onTap: () => controller.isNoteEditing.value = true,
                          child: controller.isNoteEditing.value
                              ? Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(vertical: 4),
                                  child: TextField(
                                    controller: controller.noteController,
                                    autofocus: true,
                                    maxLines: null,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: MyColors.ogColor,
                                    ),
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      isCollapsed: true,
                                      contentPadding: EdgeInsets.zero,
                                    ),
                                    onSubmitted: (_) => controller.saveNote(),
                                  ),
                                )
                              : Text(
                                  controller.noteController.text,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.brown,
                                  ),
                                ),
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            /// MAIN BODY (Extra Images)
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    bottom: 14,
                    left: 0,
                    child: Image.asset(
                      "assets/images/birds_left.png",
                      height: size.height * 0.14,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned(
                    bottom: -10,
                    right: -2,
                    child: Image.asset(
                      "assets/images/flower_right.png",
                      height: size.height * 0.24,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.08,
                    child: Container(
                      width: size.width * 0.64,
                      height: size.width * 0.60,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage("assets/images/cycle_image.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// BOTTOM BAR
            Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
  child: Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    decoration: BoxDecoration(
      color: Colors.brown.shade700,
      borderRadius: BorderRadius.circular(40),
    ),
    child: Column(
      // crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Left side icons group
        Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.camera_alt_outlined, color: Colors.white, size: 20),
            SizedBox(width: 24),
            Icon(Icons.edit_outlined, color: Colors.white, size: 20),
            SizedBox(width: 24),
            Icon(Icons.link, color: Colors.white, size: 20),
            SizedBox(width: 20),
            Icon(Icons.list, color: Colors.white, size: 20),
          ],
        ),
        Row(
          children: [
            const Spacer(),
        // Bottom aligned text
        const Text(
          "Edited 11 May 2025   11:41 PM",
          style: TextStyle(
            color: Colors.white70, 
          ),
        ),
          ],
        )
        
      ],
    ),
  ),
)

          ],
        ),
      ),
    );
  }
}
