import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/app_styles.dart';
import '../../../controllers/admin_dashboard_controller.dart';
import '../../../routes/app_routes.dart';

class AdminDashboardAppBar extends StatelessWidget {
  final AdminDashboardController controller;
  final bool isTablet;

  const AdminDashboardAppBar({
    super.key,
    required this.controller,
    this.isTablet = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isTablet ? 24.0 : 16.0,
        vertical: 12.0,
      ),
      color: Colors.transparent,
      child: Row(
        children: [
          // Left: University Logo & Title (exact style of student dashboard)
          Row(
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFFE2E8F0), width: 1.2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Center(
                  child: Icon(
                    Icons.auto_stories_rounded,
                    color: AppColors.tealBrand,
                    size: 20,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'CU SMART LIBRARY',
                    style: AppStyles.universityLogoSub,
                  ),
                  Text(
                    AppStrings.isEnglish ? 'Admin Dashboard' : 'Dashboard',
                    style: AppStyles.smartLibraryLogoTitle.copyWith(
                      fontSize: isTablet ? 18.0 : 16.5,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const Spacer(),

          // Right Action Icons
          // 1. Search Icon
          IconButton(
            onPressed: () {
              // Focus search bar
            },
            icon: const Icon(
              Icons.search_rounded,
              color: Color(0xFF334155),
              size: 24,
            ),
            tooltip: AppStrings.isEnglish ? 'Search' : 'অনুসন্ধান',
          ),

          // 2. Notification Bell with Red Dot Badge
          IconButton(
            onPressed: () => Get.toNamed(AppRoutes.notifications),
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(
                  Icons.notifications_none_rounded,
                  color: Color(0xFF334155),
                  size: 24,
                ),
                Positioned(
                  right: -1,
                  top: -1,
                  child: Container(
                    width: 9,
                    height: 9,
                    decoration: BoxDecoration(
                      color: AppColors.alertDotRed,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 1.5),
                    ),
                  ),
                ),
              ],
            ),
            tooltip: AppStrings.isEnglish ? 'Notifications' : 'বিজ্ঞপ্তি',
          ),

          const SizedBox(width: 6),

          // 3. Admin Profile Avatar
          GestureDetector(
            onTap: () => Get.toNamed(AppRoutes.profile),
            child: Container(
              padding: const EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isTablet ? AppColors.linkBlue : const Color(0xFFCBD5E1),
                  width: isTablet ? 2.0 : 1.2,
                ),
              ),
              child: CircleAvatar(
                radius: isTablet ? 19 : 17,
                backgroundColor: const Color(0xFF0F2B5C),
                child: ClipOval(
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF1E3A8A),
                          Color(0xFF0F2B5C),
                        ],
                      ),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.person_rounded,
                        color: Colors.white,
                        size: 20,
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
  }
}
