import 'package:cardinal_app/features/screens/audio_play.dart';
import 'package:cardinal_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MusicWiperCard extends StatelessWidget {
  const MusicWiperCard({
    super.key,
    this.outerBOXimage = "assets/images/slep_snd_1.png",
    this.innerBOXimage = "assets/images/slep_snd_2.png",
    this.showInnerBox = false,
    this.showInnerBoxText = false,
    this.onTap,
    this.showBelowCardASiTis = true,
    this.innerBOXtext =
        "You cannot let a fear of failure or a fear of comparison or a fear of judgment stop you from doing the things that will make you great.",
  });

  final String outerBOXimage;
  final String innerBOXimage;
  final String innerBOXtext;
  final bool showInnerBox;
  final bool showInnerBoxText;
  final bool showBelowCardASiTis;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    // final double screenWidth = MediaQuery.of(context).size.width;
    // final smallGap = screenWidth * 0.025;
    // final mediumGap = screenWidth * 0.05;
    return Column(
      children: [
        // Main Card
        InkWell(
          onTap:
              onTap ??
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SleepSoundScreen()),
                );
              },
          child: Container(
            width: 343,
            height: 214,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(outerBOXimage),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: showInnerBoxText
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        innerBOXtext,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 14,
                          fontFamily: "Raleway",
                          fontWeight: FontWeight.w500,
                          color: MyColors.ogColor,
                        ),
                      ),
                    )
                  : showInnerBox
                  ? Container(
                      width: 180,
                      height: 173,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(innerBOXimage),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha((0.1 * 255).round()),
                            blurRadius: 8,
                          ),
                        ],
                      ),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Waveform stack
                          SizedBox(height: 12),
                          SizedBox(
                            height: 103,
                            width: 151,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    "assets/images/slep_snd_1.png",
                                    fit: BoxFit.cover,
                                    height: 103,
                                    width: 151,
                                  ),
                                ),
                                Image.asset(
                                  "assets/images/wave_1.png",
                                  fit: BoxFit.contain,
                                  height: 97,
                                  width: 141.93,
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 2),

                          // Play + Time + Progress
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 8,
                                    top: 5,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Icon(
                                        Icons.play_arrow,
                                        size: 18,
                                        color: MyColors.ogColor,
                                      ),
                                      Text(
                                        "10:00",
                                        style: TextStyle(
                                          fontFamily: "Raleway-SemiBold",
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          color: MyColors.ogColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 4),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: LinearProgressIndicator(
                                    value: 1,
                                    minHeight: 4,
                                    backgroundColor: Colors.white.withAlpha(
                                      (0.5 * 255).round(),
                                    ),
                                    color: MyColors.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 3),

                          // Title
                          const Text(
                            "Wiper",
                            style: TextStyle(
                              fontFamily: "Raleway",
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: MyColors.ogColor,
                            ),
                          ),
                        ],
                      ),
                    )
                  : SizedBox.shrink(),
            ),
          ),
        ),

        if (showBelowCardASiTis) MusicWiperBelowMusicInfoCard(),
      ],
    );
  }
}

class MusicWiperBelowMusicInfoCard extends StatelessWidget {
  const MusicWiperBelowMusicInfoCard({
    super.key,
    this.showTitles = true,
    this.isRemovable = false,
  });

  final bool showTitles;
  final bool isRemovable;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 4),

        // Music Info
        showTitles
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1.2),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Music: Wiper",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontFamily: "Raleway-Bold",
                      fontSize: 12,
                      color: MyColors.bgContainer,
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink(),

        const SizedBox(height: 4),

        // Tags
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1.2),
          child: const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "#Ambition   #Inspiration   #Motivational",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: "Raleway",
                fontSize: 12,
                color: MyColors.bgContainer,
              ),
            ),
          ),
        ),

        

        // Stats row (full width, no padding)
        Container(
          height: 30,
          color: isRemovable ? Color(0XFFFF522F) : Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1.2),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Row(
                    children: const [
                      Icon(
                        Icons.remove_red_eye,
                        size: 18,
                        color: MyColors.clsWhite,
                      ),
                      SizedBox(width: 6),
                      Flexible(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "567.57k",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontFamily: "Raleway-SemiBold",
                              fontSize: 12,
                              color: MyColors.clsWhite,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Share
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Iconsax.forward_square4,
                        size: 18,
                        color: MyColors.clsWhite,
                      ),
                      SizedBox(width: 6),
                      Flexible(
                        child: Text(
                          "Share",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: "Raleway-SemiBold",
                            fontSize: 12,
                            color: MyColors.clsWhite,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Download
                Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Iconsax.document_download,
                        size: 18,
                        color: MyColors.clsWhite,
                      ),
                      SizedBox(width: 6),
                      Flexible(
                        child: Text(
                          "Download",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: "Raleway-SemiBold",
                            fontSize: 12,
                            color: MyColors.clsWhite,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Save OR Remove
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.bookmark, size: 18, color: MyColors.clsWhite),
                      const SizedBox(width: 6),
                      Flexible(
                        child: Text(
                          isRemovable ? "Remove" : "Save",
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: "Raleway-SemiBold",
                            fontSize: 12,
                            color: MyColors.clsWhite,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 4),
      ],
    );
  }
}
