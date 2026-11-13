import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/app_styles.dart';
import '../../../controllers/book_details_controller.dart';

class BookDetailsBottomActions extends StatelessWidget {
  final BookDetailsController controller;
  final bool isTablet;

  const BookDetailsBottomActions({
    super.key,
    required this.controller,
    this.isTablet = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Approval / Certification Note
        Text(
          AppStrings.recipientCertification,
          style: const TextStyle(
            fontSize: 11.5,
            fontWeight: FontWeight.w500,
            color: Color(0xFF64748B),
          ),
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 8),

        // Primary Action: ইস্যু রিকোয়েস্ট পাঠান (Submit)
        SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton(
            onPressed: controller.submitIssueRequest,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0C2B59),
              foregroundColor: Colors.white,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              shadowColor: const Color(0xFF0C2B59).withValues(alpha: 0.3),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.check_box_outlined,
                  size: 20,
                  color: Colors.white,
                ),
                const SizedBox(width: 8),
                Text(
                  AppStrings.submitIssueRequest,
                  style: AppStyles.submitButtonText.copyWith(
                    fontSize: isTablet ? 16.0 : 15.0,
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 12),

        // Secondary Action: পরে পড়ার জন্য বুকমার্ক করুন
        Obx(
          () => InkWell(
            onTap: controller.toggleBookmark,
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    controller.isBookmarked.value
                        ? Icons.bookmark_rounded
                        : Icons.bookmark_border_rounded,
                    size: 18,
                    color: controller.isBookmarked.value
                        ? AppColors.tealBrand
                        : AppColors.navyPrimary,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    controller.isBookmarked.value
                        ? 'বুকমার্কে সংরক্ষিত রয়েছে'
                        : AppStrings.bookmarkForLater,
                    style: AppStyles.bookmarkLinkText.copyWith(
                      color: controller.isBookmarked.value
                          ? AppColors.tealBrand
                          : AppColors.navyPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
