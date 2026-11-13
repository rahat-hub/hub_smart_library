import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/app_styles.dart';
import '../../../models/book_model.dart';
import 'book_cover_showcase_widget.dart';

class BookOverviewCard extends StatelessWidget {
  final BookModel book;
  final bool isTablet;

  const BookOverviewCard({
    super.key,
    required this.book,
    this.isTablet = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
      padding: EdgeInsets.all(isTablet ? 18.0 : 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Part: Cover on Left + Details on Right
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 3D Perspective Book Cover on Desk
              BookCoverShowcaseWidget(
                book: book,
                width: isTablet ? 145 : 125,
                height: isTablet ? 185 : 165,
              ),

              const SizedBox(width: 14),

              // Book Meta Information
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Publisher / Series Tag
                    Text(
                      book.publisher,
                      style: AppStyles.publisherTag,
                    ),

                    const SizedBox(height: 4),

                    // Book Title
                    Text(
                      book.title,
                      style: AppStyles.detailsBookTitle.copyWith(
                        fontSize: isTablet ? 20.0 : 16.5,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: 4),

                    // Author
                    Text(
                      book.author,
                      style: AppStyles.detailsAuthor,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: 8),

                    // Star Rating Row
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          color: AppColors.starGold,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          book.ratingTextBengali.replaceAll('★ ', ''),
                          style: AppStyles.ratingTextDetails,
                        ),
                      ],
                    ),

                    const SizedBox(height: 6),

                    // Availability Row: Checkmark Circle + "উপলব্ধ: ৭টি কপি শেলফে"
                    Row(
                      children: [
                        const Icon(
                          Icons.check_circle_outline_rounded,
                          color: AppColors.availableGreenText,
                          size: 16,
                        ),
                        const SizedBox(width: 6),
                        Flexible(
                          child: Text(
                            book.shelfCopiesTextBengali,
                            style: const TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w700,
                              color: AppColors.availableGreenText,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Bottom 3-Column Metadata Row
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFF1F5F9)),
            ),
            child: Row(
              children: [
                // Col 1: সংস্করণ
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.editionLabel,
                        style: AppStyles.metaLabel,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        book.edition,
                        style: AppStyles.metaValue,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),

                // Vertical Divider
                Container(
                  width: 1,
                  height: 28,
                  color: const Color(0xFFE2E8F0),
                ),

                // Col 2: প্রকাশনা বর্ষ
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.pubYearLabel,
                          style: AppStyles.metaLabel,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          book.publicationYear,
                          style: AppStyles.metaValue,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),

                // Vertical Divider
                Container(
                  width: 1,
                  height: 28,
                  color: const Color(0xFFE2E8F0),
                ),

                // Col 3: আইএসবিএন
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.isbnLabel,
                          style: AppStyles.metaLabel,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          book.isbn,
                          style: AppStyles.metaValue,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
