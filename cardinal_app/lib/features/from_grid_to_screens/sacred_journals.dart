import 'package:cardinal_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JournalScreen extends StatelessWidget {
  JournalScreen({super.key});

  // Sample list
  final List<Map<String, dynamic>> journals = [
    {
      "title": "My Story",
      "text":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took",
      "color": Color(0xFFC1FFFA),
    },
    {
      "title": "My Story",
      "text":
          "Lorem ipsum is simply dummy text of the printing and typesetting industry. Lorem ipsum has been the industry's standard dummy text ever since the 1500s.",
      "color": Color(0xFFFFF9C1),
    },
    {
      "title": "My Story",
      "text":
          "Lorem ipsum is simply dummy text of the printing and typesetting industry. Lorem ipsum has been the industry's standard dummy text ever since the 1500s.",
      "color": Color(0xFFFFC1F9),
    },
    {
      "title": "My Story",
      "text":
          "Lorem ipsum is simply dummy text of the printing and typesetting industry. Lorem ipsum has been the industry's standard dummy text ever since the 1500s.",
      "color": Color(0xFF000000),
    },
    {
      "title": "My Story",
      "text":
          "Lorem ipsum is simply dummy text of the printing and typesetting industry. Lorem ipsum has been the industry's standard dummy text ever since the 1500s.",
      "color": Color(0xFFC1FFFA),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe04b2d),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Top Row (Back + Title + Search)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(
                          Icons.arrow_forward,
                          color: MyColors.bgContainer,
                        ),
                      ),
                      const SizedBox(width: 6),
                      const Text(
                        "To-dos",
                        style: TextStyle(
                          fontFamily: "Railway-SemiBold",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: MyColors.bgContainer,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search, color: Colors.white),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              /// List of Journals
              Expanded(
                child: ListView.builder(
                  itemCount: journals.length,
                  itemBuilder: (context, index) {
                    final item = journals[index];
                    return GestureDetector(
                      onTap: () {
                        // Navigate to next screen
                        // Get.to(() => const SecondScreen());
                      },
                      child: Container(
                        height: 110,
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                        decoration: BoxDecoration(
                          color: item["color"],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              item["title"],
                              style: TextStyle(
                                fontFamily: "Railway-SemiBold",
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: item["color"] == Color(0xFF000000)
                                    ? Colors.white
                                    : MyColors.ogColor,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item["text"],
                              textAlign: TextAlign.center,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: "Raleway",
                                fontSize: 12,
                                color: item["color"] == Color(0xFF000000)
                                    ? Colors.white70
                                    : MyColors.ogColor,
                              ),
                            ),
                            Text(
                              ".........",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Raleway",
                                fontSize: 12,
                                color: item["color"] == Color(0xFF000000)
                                    ? Colors.white70
                                    : MyColors.ogColor,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      /// Floating Button (Bottom Right)
      floatingActionButton: GestureDetector(
        onTap: () {
          // Your onTap logic here
        },
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: const Color(0xFFFDF4E3),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                blurRadius: 6,
                offset: const Offset(2, 3),
                color: Colors.black.withOpacity(0.2),
              ),
            ],
          ),
          child: const Center(
            child: Icon(Icons.add_to_photos, color: MyColors.ogColor, size: 26),
          ),
        ),
      ),
    );
  }
}
