import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../controllers/notification_controller.dart';

class NotificationFilterChips extends StatelessWidget {
  final NotificationController controller;
  final bool isTablet;

  const NotificationFilterChips({
    super.key,
    required this.controller,
    this.isTablet = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: controller.filterOptions.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final filter = controller.filterOptions[index];
          final isSelected = controller.selectedFilter.value == filter;

          return GestureDetector(
            onTap: () => controller.selectFilter(filter),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              padding: EdgeInsets.symmetric(
                horizontal: isTablet ? 16.0 : 13.0,
                vertical: 7.0,
              ),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.navyPrimary : Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isSelected ? AppColors.navyPrimary : const Color(0xFFE2E8F0),
                  width: 1.2,
                ),
                boxShadow: isSelected
                    ? [
                  BoxShadow(
                    color: AppColors.navyPrimary.withValues(alpha: 0.22),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ]
                    : null,
              ),
              child: Center(
                child: Text(
                  filter,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                    color: isSelected ? Colors.white : const Color(0xFF334155),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
