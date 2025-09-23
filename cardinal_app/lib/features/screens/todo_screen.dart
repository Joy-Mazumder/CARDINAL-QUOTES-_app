import 'package:cardinal_app/features/controllers/todo_controller.dart';
import 'package:cardinal_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TodoController());
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 4,
            child: Image.asset(
              "assets/images/bird_3.png",
              height: 226,
              width: 132,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 56,
            child: Image.asset(
              "assets/images/bird_4.png",
              height: 179,
              width: 179,
            ),
          ),

          /// Foreground Scrollable To-do list
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Title
                  Row(
                    children:  [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(Icons.arrow_forward, color: MyColors.bgContainer)),
                      SizedBox(width: 6),
                      Text(
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
                  const SizedBox(height: 10),

                  /// List
                  Expanded(
  child: Obx(() {
    if (controller.todos.isEmpty) {
      return const Center(
        child: Text(
          "No To-dos Yet",
          style: TextStyle(color: Colors.white70, fontSize: 16),
        ),
      );
    }
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: controller.todos.length,
      itemBuilder: (context, index) {
        final todo = controller.todos[index];
        return GestureDetector(
          onTap: () => controller.toggleDone(index),
          child: _todoItem(
            todo.title,
            todo.subtitle,
            done: todo.done,
            overdue: todo.overdue,
          ),
        );
      },
    );
  }),
),

                ],
              ),
            ),
          ),

          /// Floating Add Button
          Positioned(
            bottom: 30,
            right: 30,
            child: GestureDetector(
              onTap: () {
                _showAddTodoSheet(context, controller);
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
                    ),
                  ],
                ),
                child: const Center(
                  child: Icon(
                    Icons.add_to_photos,
                    color: MyColors.ogColor,
                    size: 26,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Reusable Todo Item
Widget _todoItem(
  String title,
  String subtitle, {
  bool done = false,
  bool overdue = false,
}) {
  return Container(
    height: 46,
    margin: const EdgeInsets.only(bottom: 12),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    decoration: BoxDecoration(
      color: const Color(0xFFFDF4E3),
      borderRadius: BorderRadius.circular(30),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Icon(
              done
                  ? Icons.check_box
                  : Iconsax.tick_circle, 
              color: MyColors.ogColor,
              size: 22,
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            subtitle,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: overdue ? Colors.red : Colors.black87,
            ),
          ),
        ),
      ],
    ),
  );
}



void _showAddTodoSheet(BuildContext context, TodoController controller) {
  Get.bottomSheet(
    Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Cancel | Title | Next
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Get.back(),
                child: const Text("Cancel",
                    style: TextStyle(fontFamily: "Raleway",fontSize: 16, fontWeight: FontWeight.w500,color: MyColors.ogColor)),
              ),
              const Text("New To-dos",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,fontFamily: "Railway-SemiBold",color: MyColors.ogColor)),
              GestureDetector(
                onTap: () {
                  controller.addTodo("Nirug", "Everyday at 6:00 PM");
                  Get.back();
                },
                child: const Text("Next",
                    style: TextStyle(fontSize: 16,fontFamily: "Railway-Bold",color: MyColors.ogColor, fontWeight: FontWeight.w700)),
              ),
            ],
          ),
          const SizedBox(height: 16),

          /// 
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFF6D2D23),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              children: const [
                Icon(Iconsax.calendar_1, color: MyColors.bgContainer),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "New To-dos",
                    style: TextStyle(color: Color(0xfffef0d6ad), fontSize: 15,fontFamily: "Railway-SemiBold", fontWeight: FontWeight.w600),
                  ),
                ),
                Icon(Iconsax.clock, color: MyColors.bgContainer),
              ],
            ),
          ),
          const SizedBox(height: 14),

          _bottomSheetTile("Repeat", "Everyday"),
          const SizedBox(height: 8),
          _bottomSheetTile("End Repeat", "After 1 Month"),
          const SizedBox(height: 16),
        ],
      ),
    ),
    backgroundColor: const Color(0xFFFDF4E3),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
  );
}

  /// Reusable Bottom Sheet Option Tile
  Widget _bottomSheetTile(String title, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: MyColors.ogColor,
            ),
          ),
          Row(
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: MyColors.ogColor,
                ),
              ),
              const SizedBox(width: 5),
              const Icon(Iconsax.arrow_right_3, size: 18, color: MyColors.ogColor),
            ],
          ),
        ],
      ),
    );
  }
