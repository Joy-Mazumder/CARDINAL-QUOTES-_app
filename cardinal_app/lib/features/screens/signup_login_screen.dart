import 'package:cardinal_app/bottom_navigation.dart';
import 'package:cardinal_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AuthController extends GetxController {
  var isLogin = false.obs;
  var isPasswordHidden = true.obs;
  var isConfirmPasswordHidden = true.obs;

  void toggleAuthMode(bool login) {
    isLogin.value = login;
  }

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordHidden.value = !isConfirmPasswordHidden.value;
  }
}

class SignUpLoginScreen extends StatelessWidget {
  SignUpLoginScreen({super.key});

  final AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff6ebda),
      body: SafeArea(
        child: Stack(
          children: [
            /// Top Bird Image
            Positioned(
              top: 0,
              right: -6,
              child: Image.asset(
                "assets/images/beautiful_bird.png",
                width: 180,
                height: 180,
              ),
            ),

            /// Bottom Flower Image
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                "assets/images/flower_life.png",
                fit: BoxFit.cover,
              ),
            ),

            /// Main Content
            Column(
              children: [
                const SizedBox(height: 160),

                /// Toggle Buttons
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () => controller.toggleAuthMode(false),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: !controller.isLogin.value
                              ? MyColors.ogColor
                              : Colors.transparent,
                          foregroundColor: !controller.isLogin.value
                              ? MyColors.bgContainer
                              : Colors.black,
                          side: const BorderSide(color: Color(0xff6a2c1a)),
                          elevation: 0,
                        ),
                        child: const Text("Sign Up"),
                      ),
                      const SizedBox(width: 86),
                      ElevatedButton(
                        onPressed: () => controller.toggleAuthMode(true),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: controller.isLogin.value
                              ? MyColors.ogColor
                              : Colors.transparent,
                          foregroundColor: controller.isLogin.value
                              ? MyColors.bgContainer
                              : Colors.black,
                          side: const BorderSide(color: Color(0xff6a2c1a)),
                          elevation: 0,
                        ),
                        child: const Text("Log In"),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                /// Fields
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        if (!controller.isLogin.value) ...[
                          _buildTextField("Enter your name", Iconsax.user),
                          const SizedBox(height: 14),
                          _buildTextField("Enter your phone", Iconsax.call),
                          const SizedBox(height: 14),
                          _buildPasswordField(
                            "Enter password",
                            controller.isPasswordHidden,
                            onToggle: controller.togglePasswordVisibility,
                          ),
                          const SizedBox(height: 14),
                          _buildPasswordField(
                            "Confirm password",
                            controller.isConfirmPasswordHidden,
                            onToggle:
                                controller.toggleConfirmPasswordVisibility,
                          ),
                          const SizedBox(height: 14),
                          _buildTextField("Enter your email", Iconsax.sms),
                        ] else ...[
                          _buildTextField(
                            "Enter your email address",
                            Iconsax.sms,
                          ),
                          const SizedBox(height: 14),
                          _buildPasswordField(
                            "Enter Password",
                            controller.isPasswordHidden,
                            onToggle: controller.togglePasswordVisibility,
                          ),
                        ],
                        const SizedBox(height: 25),

                        /// Next Button
                        SizedBox(
                          height: 32,
                          width: 94,
                          child: ElevatedButton(
                            onPressed: () {Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NavigationMenu(),
                              ),
                            );},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff6a2c1a),
                              // minimumSize: const Size(double.infinity, 48),
                            ),
                            child: const Text(
                              "Next",
                              style: TextStyle(
                                fontFamily: "Railway",
                                color: MyColors.bgContainer,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Normal TextField
  Widget _buildTextField(String hint, IconData icon) {
    return SizedBox(
      width: 352,
      height: 36,
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          // prefixIcon: Icon(icon, color: Colors.grey),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          filled: true,

          fillColor: Colors.white,
        ),
      ),
    );
  }

  /// Password TextField with Eye Toggle
  Widget _buildPasswordField(
    String hint,
    RxBool isHidden, {
    required VoidCallback onToggle,
  }) {
    return Obx(
      () => SizedBox(
        width: 352,
        height: 36,
        child: TextField(
          obscureText: isHidden.value,
          decoration: InputDecoration(
            hintText: hint,
            // prefixIcon: const Icon(Iconsax.lock, color: Colors.grey),
            suffixIcon: IconButton(
              onPressed: onToggle,
              icon: Icon(
                isHidden.value ? Iconsax.eye_slash : Iconsax.eye,
                color: Colors.grey,
              ),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
