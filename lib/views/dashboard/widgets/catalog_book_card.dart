import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_styles.dart';
import '../../../controllers/dashboard_controller.dart';
import '../../../models/book_model.dart';
import '../../../routes/app_routes.dart';
import 'book_cover_widget.dart';

class CatalogBookCard extends StatelessWidget {
  final BookModel book;
  final DashboardController controller;
  final bool isTablet;

  const CatalogBookCard({
    super.key,
    required this.book,
    required this.controller,
    this.isTablet = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.bookDetails, arguments: book),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFE2E8F0), width: 1.2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: EdgeInsets.all(isTablet ? 14.0 : 12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          // Left: Book Cover Thumbnail
          BookCoverWidget(
            book: book,
            width: isTablet ? 56 : 50,
            height: isTablet ? 76 : 68,
            borderRadius: 8,
            isThumbnail: true,
          ),

          const SizedBox(width: 14),

          // Middle: Book Details & Metadata Badges
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title
                Text(
                  book.title,
                  style: AppStyles.bookTitle.copyWith(
                    fontSize: isTablet ? 15.5 : 14.0,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 2),

                // Author
                Text(
                  book.author,
                  style: AppStyles.bookAuthor.copyWith(
                    fontSize: isTablet ? 12.5 : 12.0,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 8),

                // Badges Row: Rack + Availability
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    // Rack Chip
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.rackChipBg,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: const Color(0xFFE2E8F0),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.shelves,
                            size: 13,
                            color: Color(0xFF64748B),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            book.rack,
                            style: const TextStyle(
                              fontSize: 11.5,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF475569),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Status Chip
                    if (book.isAvailable)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.availableGreenBg,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 5,
                              height: 5,
                              decoration: const BoxDecoration(
                                color: AppColors.availableGreenText,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              book.availableCopies > 0
                                  ? book.copiesTextBengali
                                  : 'Available',
                              style: const TextStyle(
                                fontSize: 11.5,
                                fontWeight: FontWeight.w600,
                                color: AppColors.availableGreenText,
                              ),
                            ),
                          ],
                        ),
                      )
                    else
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.waitlistBadgeBg,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.access_time_rounded,
                              size: 12,
                              color: AppColors.waitlistBadgeText,
                            ),
                            SizedBox(width: 4),
                            Text(
                              'Issued / Waitlist',
                              style: TextStyle(
                                fontSize: 11.5,
                                fontWeight: FontWeight.w600,
                                color: AppColors.waitlistBadgeText,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 10),

          // Right: Bookmark Button
          IconButton(
            onPressed: () => controller.toggleBookmark(book.id),
            icon: Icon(
              book.isBookmarked
                  ? Icons.bookmark_rounded
                  : Icons.bookmark_outline_rounded,
              color: book.isBookmarked
                  ? AppColors.tealBrand
                  : const Color(0xFF94A3B8),
              size: 22,
            ),
            splashRadius: 20,
            tooltip: 'বুকমার্ক করুন',
          ),
        ],
      ),
    ),
  );
}
}
