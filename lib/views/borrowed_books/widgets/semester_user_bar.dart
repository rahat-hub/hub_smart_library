import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/app_styles.dart';

class SemesterUserBar extends StatelessWidget {
  final bool isTablet;

  const SemesterUserBar({
    super.key,
    this.isTablet = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Left: School icon + Semester & User ID
        Flexible(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.school_outlined,
                size: 17,
                color: AppColors.navyPrimary,
              ),
              const SizedBox(width: 6),
              Flexible(
                child: Text(
                  AppStrings.springSemesterUser,
                  style: AppStyles.semesterUserText.copyWith(
                    fontSize: isTablet ? 13.0 : 11.5,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(width: 8),

        // Right: "সক্রিয় সদস্য" Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3.5),
          decoration: BoxDecoration(
            color: const Color(0xFFDCFCE7),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFBBF7D0)),
          ),
          child: Text(
            AppStrings.activeMemberBadge,
            style: AppStyles.activeMemberBadge.copyWith(
              fontSize: isTablet ? 12.0 : 11.0,
            ),
          ),
        ),
      ],
    );
  }
}
