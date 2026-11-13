import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/app_styles.dart';
import '../../../controllers/dashboard_controller.dart';

class DashboardAppBar extends StatelessWidget {
  final DashboardController controller;
  final bool isTablet;

  const DashboardAppBar({
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
          // Left: University Logo & Title
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
                    AppStrings.universityUpper,
                    style: AppStyles.universityLogoSub,
                  ),
                  Text(
                    AppStrings.smartLibraryTitle,
                    style: AppStyles.smartLibraryLogoTitle.copyWith(
                      fontSize: isTablet ? 18.0 : 16.5,
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
            tooltip: 'অনুসন্ধান',
          ),

          // 2. Notification Bell with Red Dot Badge
          IconButton(
            onPressed: controller.showNotifications,
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
            tooltip: 'বিজ্ঞপ্তি',
          ),

          const SizedBox(width: 6),

          // 3. User Profile Avatar
          GestureDetector(
            onTap: controller.showDigitalPassDialog,
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
                backgroundColor: const Color(0xFF1E3A8A),
                child: ClipOval(
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF3B82F6),
                          Color(0xFF1D4ED8),
                        ],
                      ),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.person_rounded,
                        color: Colors.white,
                        size: 22,
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
