import 'package:cardinal_app/features/reuseable_widgets/sound_screen_music_card.dart';
import 'package:flutter/material.dart';
import 'package:cardinal_app/utils/constants/colors.dart';


class SoundsScreen extends StatelessWidget {
  const SoundsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: MyColors.primary,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_forward, color: MyColors.bgContainer),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            'Sleep Sounds',
            style: TextStyle(
              fontSize: 15,
              color: MyColors.bgContainer,
              fontFamily: "Raleway-SemiBold",
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: false,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child:Column(
            children: [
              MusicWiperCard(),
              SizedBox(height: 10,),
              MusicWiperCard(outerBOXimage: "assets/images/slep_snd_an_1.png",),
              SizedBox(height: 10,),
              MusicWiperCard(),
            ],
          ),
        ),
      ),
    );
  }
}

