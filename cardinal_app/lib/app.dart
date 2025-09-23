import 'package:cardinal_app/bottom_navigation.dart';
import 'package:cardinal_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cardinal App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: MyColors.primary,
      ),
      home: NavigationMenu()
    ) ;
  }
}