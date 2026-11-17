import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/app_styles.dart';

class ProfileHeaderBar extends StatelessWidget {
  final bool isTablet;

  const ProfileHeaderBar({
    super.key,
    this.isTablet = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Left Column: Title & Subtitle
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppStrings.studentProfileTitle,
                style: AppStyles.dashboardHeaderTitle.copyWith(
                  fontSize: isTablet ? 24.0 : 20.0,
                  fontWeight: FontWeight.w800,
                  color: AppColors.slateHeading,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                AppStrings.digitalPassServiceSubtitle,
                style: TextStyle(
                  fontSize: isTablet ? 13.5 : 12.0,
                  color: AppColors.slateSubtitle,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(width: 8),

        // Right Active Member Badge
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: isTablet ? 12 : 10,
            vertical: isTablet ? 6 : 5,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFFD1FAE5),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFFA7F3D0), width: 1.2),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 7,
                height: 7,
                decoration: const BoxDecoration(
                  color: Color(0xFF059669),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                AppStrings.activeMemberBadge,
                style: const TextStyle(
                  color: Color(0xFF065F46),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
