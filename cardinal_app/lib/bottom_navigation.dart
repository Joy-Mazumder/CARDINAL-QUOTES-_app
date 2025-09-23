import 'package:cardinal_app/features/screens/home_screen.dart';
import 'package:cardinal_app/features/screens/more_screen.dart';
import 'package:cardinal_app/features/screens/soul_screen.dart';
import 'package:cardinal_app/features/screens/sounds_screen.dart';
import 'package:cardinal_app/features/screens/top_screen.dart';
import 'package:cardinal_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => Container(
          decoration: BoxDecoration(
            color: MyColors.bgContainer,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: BottomNavigationBar(
            currentIndex: controller.selectedIndex.value,
            onTap: (index) => controller.selectedIndex.value = index,
            backgroundColor: Colors.transparent,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: MyColors.btmNavBar,
            unselectedItemColor: MyColors.btmNavBar,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon( Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconsax.music),
                label: "Sounds",
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconsax.lovely4),
                label: "Soul",
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(Iconsax.quote_down5),
                icon: Icon( Iconsax.quote_down),
                label: "Top",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.more_vert),
                label: "More",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const SoundsScreen(),
    const SoulScreen(),
    const TopScreen(),
    const MoreScreen(),
    
  ];
}
