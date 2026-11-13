import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/app_styles.dart';
import '../../../controllers/dashboard_controller.dart';
import '../../../models/book_model.dart';
import '../../../routes/app_routes.dart';
import 'book_cover_widget.dart';

class PopularBookCard extends StatelessWidget {
  final BookModel book;
  final DashboardController controller;
  final double? width;
  final bool isTablet;

  const PopularBookCard({
    super.key,
    required this.book,
    required this.controller,
    this.width,
    this.isTablet = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.bookDetails, arguments: book),
      child: Container(
        width: width ?? (isTablet ? null : 220),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0xFFE2E8F0), width: 1.2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
          // Book Cover with Bookmark & Rating Overlays
          Stack(
            children: [
              // Realistic Book Cover
              BookCoverWidget(
                book: book,
                height: isTablet ? 200 : 180,
                width: double.infinity,
                borderRadius: 12,
              ),

              // Top-Right Floating Bookmark Button
              Positioned(
                top: 8,
                right: 8,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => controller.toggleBookmark(book.id),
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.92),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.15),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Icon(
                        book.isBookmarked
                            ? Icons.bookmark_rounded
                            : Icons.bookmark_outline_rounded,
                        color: book.isBookmarked
                            ? AppColors.tealBrand
                            : const Color(0xFF475569),
                        size: 18,
                      ),
                    ),
                  ),
                ),
              ),

              // Bottom Rating Overlay Pill
              Positioned(
                left: 8,
                bottom: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.65),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.star_rounded,
                        color: AppColors.starGold,
                        size: 14,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        book.ratingTextBengali.replaceAll('★ ', ''),
                        style: AppStyles.ratingText,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // Title
          Text(
            book.title,
            style: AppStyles.bookTitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),

          const SizedBox(height: 2),

          // Author
          Text(
            book.author,
            style: AppStyles.bookAuthor,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),

          const SizedBox(height: 10),

          // Bottom Action Row: Availability + "ধার নিন" button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Availability Indicator
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      color: AppColors.tealBrand,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    book.copiesTextBengali,
                    style: AppStyles.availableTag,
                  ),
                ],
              ),

              // "ধার নিন" (Borrow) Button
              ElevatedButton(
                onPressed: () => controller.borrowBook(book),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.navyPrimary,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  minimumSize: Size.zero,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  AppStrings.borrowNow,
                  style: AppStyles.borrowBtn,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
}
