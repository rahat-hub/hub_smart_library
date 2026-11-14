import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/app_styles.dart';
import '../../../controllers/borrowed_books_controller.dart';

class BorrowedSegmentedTabs extends StatelessWidget {
  final BorrowedBooksController controller;
  final bool isTablet;

  const BorrowedSegmentedTabs({
    super.key,
    required this.controller,
    this.isTablet = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFEDF2F9),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Obx(
        () => Row(
          children: [
            // Tab 1: বর্তমান বইসমূহ (৩)
            Expanded(
              child: _buildTabItem(
                title: AppStrings.tabCurrentBooks,
                icon: Icons.bookmark_rounded,
                isSelected: controller.selectedTab.value == 0,
                onTap: () => controller.switchTab(0),
              ),
            ),

            const SizedBox(width: 4),

            // Tab 2: ফেরত দেওয়া বই (১৮)
            Expanded(
              child: _buildTabItem(
                title: AppStrings.tabReturnedBooks,
                icon: Icons.assignment_return_rounded,
                isSelected: controller.selectedTab.value == 1,
                onTap: () => controller.switchTab(1),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem({
    required String title,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 16,
                color: isSelected ? AppColors.navyPrimary : AppColors.slateSubtitle,
              ),
              const SizedBox(width: 6),
              Flexible(
                child: Text(
                  title,
                  style: isSelected
                      ? AppStyles.segmentTabActive
                      : AppStyles.segmentTabInactive,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
