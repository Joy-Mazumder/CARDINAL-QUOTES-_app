import 'package:cardinal_app/features/animation/image_animation.dart';
import 'package:cardinal_app/features/controllers/sleep_sound_controller.dart';
import 'package:cardinal_app/features/reuseable_widgets/sound_screen_music_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:cardinal_app/utils/constants/colors.dart';

class MeditationScreen extends StatelessWidget {
  final controller = Get.put(SleepSoundController());
  MeditationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Top Row: Arrow + Title
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Iconsax.arrow_left, color: MyColors.clsWhite),
                  ),
                  const SizedBox(width: 6),
                  const Text(
                    "Meditation",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Raleway-SemiBold",
                      color: MyColors.clsWhite,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              /// Rotating Circle Image (Takes most space)
              Expanded(
                flex: 4,
                child: Center(
                  child: RotatingCircleImage(
                    imagePath: "assets/images/slep_snd_1.png",
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// Volume Bar (Right aligned)
              Align(
                alignment: Alignment.centerRight,
                child: Obx(() {
                  return GestureDetector(
                    onVerticalDragUpdate: (details) {
                      double newValue = controller.volume.value - details.primaryDelta! / 100;
                      newValue = newValue.clamp(0.0, 1.0);
                      controller.updateVolume(newValue);
                    },
                    child: Container(
                      width: size.width * 0.04,
                      height: size.height * 0.18,
                      decoration: BoxDecoration(
                        color: MyColors.bgContainer,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: FractionallySizedBox(
                          heightFactor: controller.volume.value,
                          child: Container(
                            decoration: BoxDecoration(
                              color: MyColors.ogColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),

              const SizedBox(height: 20),

              /// Play Button + Volume Icon
               Row(
  children: [
    /// Center Play Button
    Expanded(
      child: Center(
        child: Obx(() => GestureDetector(
              onTap: controller.togglePlayPause,
              child: AnimatedScale(
                scale: controller.isPlaying.value ? 1.1 : 1.0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: Container(
                  width: size.width * 0.14,
                  height: size.width * 0.14,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: Icon(
                    controller.isPlaying.value
                        ? Icons.pause
                        : Icons.play_arrow,
                    color: MyColors.bgContainer,
                    size: size.width * 0.1,
                  ),
                ),
              ),
            )),
      ),
    ),
    
    /// Right-side Button 
    const Icon(Icons.volume_up, color: MyColors.bgContainer),
  ],
),


              const SizedBox(height: 20),

              /// Progress Bar + Time
              Obx(() {
                double progress =
                    controller.currentTime.value / controller.totalTime.value;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    GestureDetector(
                      onHorizontalDragUpdate: (details) {
                        double boxWidth = MediaQuery.of(context).size.width - 32;
                        double newValue = (details.localPosition.dx / boxWidth) *
                            controller.totalTime.value;
                        newValue =
                            newValue.clamp(0.0, controller.totalTime.value);
                        controller.updateTime(newValue);
                      },
                      child: Container(
                        height: 8,
                        decoration: BoxDecoration(
                          color: MyColors.bgContainer,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: FractionallySizedBox(
                          alignment: Alignment.centerLeft,
                          widthFactor: progress,
                          child: Container(
                            decoration: BoxDecoration(
                              color: MyColors.ogColor,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.currentTime.value
                              .toStringAsFixed(2)
                              .replaceAll('.', ':'),
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          controller.totalTime.value
                              .toStringAsFixed(2)
                              .replaceAll('.', ':'),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                );
              }),

              const SizedBox(height: 16),

              /// Bottom Music Info Card
              MusicWiperBelowMusicInfoCard(),
            ],
          ),
        ),
      ),
    );
  }
}
