import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/app_styles.dart';
import '../../../controllers/book_details_controller.dart';

class BookDetailsAppBar extends StatelessWidget {
  final BookDetailsController controller;
  final bool isTablet;

  const BookDetailsAppBar({
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
          // Back button with circular outline / dashed highlight
          InkWell(
            onTap: () => Get.back(),
            borderRadius: BorderRadius.circular(24),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFF93C5FD),
                  width: 1.5,
                ),
              ),
              child: const Icon(
                Icons.arrow_back_rounded,
                color: AppColors.slateHeading,
                size: 20,
              ),
            ),
          ),

          const SizedBox(width: 12),

          // Small Book Logo & "Book Details" Title
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                ),
                child: const Center(
                  child: Icon(
                    Icons.auto_stories_rounded,
                    color: AppColors.tealBrand,
                    size: 15,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                AppStrings.bookDetailsTitle,
                style: AppStyles.detailsScreenTitle.copyWith(
                  fontSize: isTablet ? 20.0 : 18.0,
                ),
              ),
            ],
          ),

          const Spacer(),

          // Right: Bookmark Toggle Button
          Obx(
            () => IconButton(
              onPressed: controller.toggleBookmark,
              icon: Icon(
                controller.isBookmarked.value
                    ? Icons.bookmark_rounded
                    : Icons.bookmark_border_rounded,
                color: controller.isBookmarked.value
                    ? AppColors.tealBrand
                    : const Color(0xFF475569),
                size: 24,
              ),
              tooltip: 'বুকমার্ক করুন',
            ),
          ),

          const SizedBox(width: 4),

          // Right: User Profile Avatar
          Container(
            padding: const EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFCBD5E1), width: 1.2),
            ),
            child: CircleAvatar(
              radius: isTablet ? 18 : 16,
              backgroundColor: const Color(0xFF1E3A8A),
              child: const ClipOval(
                child: Icon(
                  Icons.person_rounded,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
