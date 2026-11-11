import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/app_styles.dart';
import '../../../controllers/auth_controller.dart';

class LoginFormCard extends StatelessWidget {
  final AuthController controller;

  const LoginFormCard({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isStudent = controller.currentRole.value == UserRole.student;

      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: const Color(0xFFE2E8F0),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF0F172A).withValues(alpha: 0.04),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Label Row 1: ID / Roll
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    isStudent
                        ? AppStrings.labelStudentId
                        : AppStrings.labelAdminId,
                    style: AppStyles.fieldLabel,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  isStudent
                      ? AppStrings.hintStudentId
                      : AppStrings.hintAdminId,
                  style: AppStyles.fieldHint,
                ),
              ],
            ),
            const SizedBox(height: 8),

            // ID Input Field
            Container(
              decoration: BoxDecoration(
                color: AppColors.inputFieldBg,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: const Color(0xFFE2E8F0),
                  width: 1,
                ),
              ),
              child: TextField(
                controller: controller.idController,
                style: AppStyles.inputText,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.badge_outlined,
                    color: Color(0xFF64748B),
                    size: 22,
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.close_rounded,
                      color: Color(0xFF94A3B8),
                      size: 20,
                    ),
                    onPressed: controller.clearIdText,
                    tooltip: 'মুছুন',
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 14,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 18),

            // Label Row 2: Password / PIN + Forgot PIN
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    AppStrings.labelPassword,
                    style: AppStyles.fieldLabel,
                  ),
                ),
                const SizedBox(width: 8),
                InkWell(
                  onTap: controller.showForgotPinDialog,
                  child: Text(
                    AppStrings.forgotPin,
                    style: AppStyles.forgotPin,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Password Input Field
            Container(
              decoration: BoxDecoration(
                color: AppColors.inputFieldBg,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: const Color(0xFFE2E8F0),
                  width: 1,
                ),
              ),
              child: TextField(
                controller: controller.passwordController,
                obscureText: controller.isPasswordHidden.value,
                style: AppStyles.inputText,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.password_rounded,
                    color: Color(0xFF64748B),
                    size: 22,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.isPasswordHidden.value
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: const Color(0xFF64748B),
                      size: 20,
                    ),
                    onPressed: controller.togglePasswordVisibility,
                    tooltip: 'পাসওয়ার্ড প্রদর্শন',
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 14,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 14),

            // Remember Me Checkbox
            Row(
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: Checkbox(
                    value: controller.rememberMe.value,
                    onChanged: controller.toggleRememberMe,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    activeColor: AppColors.navyPrimary,
                  ),
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: GestureDetector(
                    onTap: () => controller.toggleRememberMe(
                        !controller.rememberMe.value),
                    child: Text(
                      AppStrings.rememberMe,
                      style: AppStyles.rememberMe,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Main Submit Button: লগইন করুন (Log In) ➔
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: controller.isLoading.value
                    ? null
                    : controller.performLogin,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.navyButton,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 2,
                  shadowColor: AppColors.navyButton.withValues(alpha: 0.35),
                ),
                child: controller.isLoading.value
                    ? const SizedBox(
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.5,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppStrings.loginButton,
                              style: AppStyles.loginButton,
                            ),
                            const SizedBox(width: 8),
                            const Icon(
                              Icons.arrow_forward_rounded,
                              size: 19,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
