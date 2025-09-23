import 'package:cardinal_app/features/reuseable_widgets/sound_screen_music_card.dart';
import 'package:flutter/material.dart';

class MemorialCard extends StatelessWidget {
  const MemorialCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              // header
              Row(
                children: const [
                  Icon(Icons.arrow_right_alt, color: Colors.white),
                  SizedBox(width: 6),
                  Text(
                    "Top Quotes",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16,),
              
              MusicWiperCard(
                outerBOXimage: "assets/images/memry_1.png",
                showInnerBox: false,
                showBelowCardASiTis: false,
                onTap: () {},
              ),
              MusicWiperBelowMusicInfoCard(showTitles: false,isRemovable: false,),
              
              
              MusicWiperCard(
                outerBOXimage: "assets/images/memry_2.png",
                showInnerBox: false,
                showBelowCardASiTis: false,
                showInnerBoxText: true,
                onTap: () {},
              ),
              MusicWiperBelowMusicInfoCard(showTitles: false,),

              
              MusicWiperCard(
                outerBOXimage: "assets/images/memry_3.png",
                showInnerBox: false,
                showBelowCardASiTis: false,
                onTap: () {},
              ),
              MusicWiperBelowMusicInfoCard(showTitles: false,),


            ],
          ),
        ),
      ),
    );
  }
}
