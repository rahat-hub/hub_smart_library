import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/app_styles.dart';

class BookBreadcrumbBar extends StatelessWidget {
  final bool isOnlineReserved;
  final bool isTablet;

  const BookBreadcrumbBar({
    super.key,
    this.isOnlineReserved = true,
    this.isTablet = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Left Breadcrumb: [Book icon] ক্যাটালগ > বইয়ের বিবরণ
        Flexible(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.auto_stories_outlined,
                size: 16,
                color: AppColors.slateSubtitle,
              ),
              const SizedBox(width: 6),
              // "ক্যাটালগ" in a subtle bordered box
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: const Color(0xFF93C5FD),
                    width: 1.2,
                  ),
                ),
                child: Text(
                  AppStrings.breadcrumbCatalog,
                  style: AppStyles.breadcrumbSub.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.navyPrimary,
                  ),
                ),
              ),
              const SizedBox(width: 6),
              const Text(
                '›',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: AppColors.slateSubtitle,
                ),
              ),
              const SizedBox(width: 6),
              Flexible(
                child: Text(
                  AppStrings.breadcrumbBookDetails,
                  style: AppStyles.breadcrumbText,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(width: 8),

        // Right Pill: • অনলাইন সংরক্ষিত
        if (isOnlineReserved)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.tealLightBg,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    color: AppColors.availableGreenText,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  AppStrings.onlinePreserved,
                  style: const TextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF0F766E),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
