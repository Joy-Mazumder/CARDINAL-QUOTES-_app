import 'package:cardinal_app/features/reuseable_widgets/sound_screen_music_card.dart';
import 'package:cardinal_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/sleep_sound_controller.dart';

class SleepSoundScreen extends StatelessWidget {
  final controller = Get.put(SleepSoundController());

  SleepSoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.height < 650;

    return Scaffold(
      backgroundColor: const Color(0xFFD1462F),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.04,
            vertical: size.height * 0.015,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 🔙 Top Row
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Get.back(),
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    "Sleep Sounds",
                    style: TextStyle(
                      fontFamily: "Raleway",
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              SizedBox(height: size.height * 0.02),

              /// 🟩 Main Card
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.04,
                  vertical: size.height * 0.02,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /// Image
                    SizedBox(
                      height: size.height * 0.26,
                      width: size.width * 0.8,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          "assets/images/slep_snd_1.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    SizedBox(height: size.height * 0.02),

                    /// Wave Animation
                    Obx(() => AnimatedScale(
                          scale: controller.isPlaying.value ? 1.05 : 1.0,
                          duration: const Duration(milliseconds: 800),
                          curve: Curves.easeInOut,
                          child: Image.asset(
                            "assets/images/wave_2.png",
                            height: size.height * 0.05,
                            width: size.width * 0.35,
                            fit: BoxFit.cover,
                          ),
                        )),
                  ],
                ),
              ),

              SizedBox(height: size.height * 0.03),

              /// 🔊 Volume Bar (Right aligned)
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
                      height: isSmallScreen ? size.height * 0.12 : size.height * 0.16,
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

              SizedBox(height: size.height * 0.025),

              ///  Play + Volume Icon
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

              SizedBox(height: size.height * 0.03),

              ///  Custom Progress Line
              Obx(() {
                double progress =
                    controller.currentTime.value / controller.totalTime.value;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    GestureDetector(
                      onHorizontalDragUpdate: (details) {
                        double boxWidth = size.width - (size.width * 0.08);
                        double newValue =
                            (details.localPosition.dx / boxWidth) * controller.totalTime.value;
                        newValue = newValue.clamp(0.0, controller.totalTime.value);
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
                    SizedBox(height: size.height * 0.008),
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

              SizedBox(height: size.height * 0.02),

              /// 
              Expanded(child: MusicWiperBelowMusicInfoCard()),
            ],
          ),
        ),
      ),
    );
  }
}






// // Play Button
//               Center(
//                 child: Obx(() => GestureDetector(
//                       onTap: controller.togglePlayPause,
//                       child: AnimatedScale(
//                         scale: controller.isPlaying.value ? 1.1 : 1.0,
//                         duration: const Duration(milliseconds: 300),
//                         curve: Curves.easeInOut,
//                         child: Container(
//                           width: 80,
//                           height: 80,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             border: Border.all(color: Colors.white, width: 2),
//                           ),
//                           child: Icon(
//                             controller.isPlaying.value
//                                 ? Icons.pause
//                                 : Icons.play_arrow,
//                             color: Colors.white,
//                             size: 48,
//                           ),
//                         ),
//                       ),
//                     )),
//               ),