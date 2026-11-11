import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/app_styles.dart';
import '../../../controllers/auth_controller.dart';

class RoleToggleWidget extends StatelessWidget {
  final AuthController controller;

  const RoleToggleWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isStudent = controller.currentRole.value == UserRole.student;

      return Container(
        height: 52,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: AppColors.tabContainerBg,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0xFFE2E8F0),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            // Student Segment
            Expanded(
              child: GestureDetector(
                onTap: () => controller.switchRole(UserRole.student),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  decoration: BoxDecoration(
                    color: isStudent ? Colors.white : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: isStudent
                        ? [
                            BoxShadow(
                              color: const Color(0xFF64748B).withValues(alpha: 0.12),
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                          ]
                        : null,
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.school_outlined,
                              size: 18,
                              color: isStudent
                                  ? AppColors.navyPrimary
                                  : AppColors.slateSubtitle,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              AppStrings.tabStudent,
                              style: isStudent
                                  ? AppStyles.tabActive
                                  : AppStyles.tabInactive,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Admin Segment
            Expanded(
              child: GestureDetector(
                onTap: () => controller.switchRole(UserRole.admin),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  decoration: BoxDecoration(
                    color: !isStudent ? Colors.white : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: !isStudent
                        ? [
                            BoxShadow(
                              color: const Color(0xFF64748B).withValues(alpha: 0.12),
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                          ]
                        : null,
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.admin_panel_settings_outlined,
                              size: 18,
                              color: !isStudent
                                  ? AppColors.navyPrimary
                                  : AppColors.slateSubtitle,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              AppStrings.tabAdmin,
                              style: !isStudent
                                  ? AppStyles.tabActive
                                  : AppStyles.tabInactive,
                            ),
                          ],
                        ),
                      ),
                    ),
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
