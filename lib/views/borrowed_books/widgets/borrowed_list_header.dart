import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/app_styles.dart';

class BorrowedListHeader extends StatelessWidget {
  final bool isTablet;

  const BorrowedListHeader({
    super.key,
    this.isTablet = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Left: Title + Session Badge
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppStrings.borrowedListTitle,
              style: AppStyles.sectionTitle.copyWith(
                fontSize: isTablet ? 17.5 : 15.5,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2.5),
              decoration: BoxDecoration(
                color: const Color(0xFFEFF6FF),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: const Color(0xFFDBEAFE)),
              ),
              child: const Text(
                AppStrings.sessionBadgeText,
                style: TextStyle(
                  fontSize: 10.5,
                  fontWeight: FontWeight.w700,
                  color: AppColors.linkBlue,
                ),
              ),
            ),
          ],
        ),

        // Right: Last Sync Time
        Text(
          AppStrings.lastSyncText,
          style: const TextStyle(
            fontSize: 11.0,
            fontWeight: FontWeight.w500,
            color: AppColors.slateMuted,
          ),
        ),
      ],
    );
  }
}
