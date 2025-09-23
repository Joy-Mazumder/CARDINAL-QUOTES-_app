import 'package:get/get.dart';

class SleepSoundController extends GetxController {
  var isPlaying = false.obs;
  var currentTime = 4.0.obs;
  var totalTime = 12.0.obs;
  var volume = 0.7.obs;

  void togglePlayPause() {
    isPlaying.value = !isPlaying.value;
  }

  void updateTime(double value) {
    currentTime.value = value;
  }

  void updateVolume(double value) {
    volume.value = value;
  }
}
