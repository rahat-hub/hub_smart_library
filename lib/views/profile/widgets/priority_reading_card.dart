import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../models/book_model.dart';
import '../../../models/profile_model.dart';
import '../../../routes/app_routes.dart';
import '../../dashboard/widgets/book_cover_widget.dart';

class PriorityReadingCard extends StatelessWidget {
  final ProfileModel profile;
  final bool isTablet;

  const PriorityReadingCard({
    super.key,
    required this.profile,
    this.isTablet = false,
  });

  @override
  Widget build(BuildContext context) {
    final dummyBook = BookModel(
      id: 'clrs_priority',
      title: profile.priorityBookTitle,
      author: profile.priorityBookAuthor,
      availableCopies: 1,
      rack: profile.priorityBookRack,
      category: 'CS',
      coverStyle: BookCoverStyle.algorithmsClrs,
    );

    return Container(
      width: double.infinity,
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
      padding: EdgeInsets.all(isTablet ? 16.0 : 13.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Top Row: Priority Header + Remaining Days
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.bookmark_outline_rounded,
                    size: 16,
                    color: AppColors.tealBrand,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    AppStrings.priorityReadingHeader,
                    style: TextStyle(
                      color: AppColors.slateHeading,
                      fontSize: isTablet ? 13.5 : 12.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Text(
                AppStrings.remainingDays4,
                style: TextStyle(
                  color: const Color(0xFFD97706),
                  fontSize: isTablet ? 12 : 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // 2. Book Info Row: Thumbnail + Details + Return Button
          Row(
            children: [
              // Book Thumbnail
              SizedBox(
                width: 44,
                height: 58,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: BookCoverWidget(
                    book: dummyBook,
                    isCompact: true,
                  ),
                ),
              ),

              const SizedBox(width: 12),

              // Title, Author, Rack & Progress
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      profile.priorityBookTitle,
                      style: TextStyle(
                        fontSize: isTablet ? 14 : 13,
                        fontWeight: FontWeight.bold,
                        color: AppColors.slateHeading,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 3),
                    Text(
                      '${profile.priorityBookAuthor} • ${AppStrings.isEnglish ? 'Rack' : 'র‍্যাক'}: ${profile.priorityBookRack}',
                      style: TextStyle(
                        fontSize: isTablet ? 12 : 11,
                        color: AppColors.slateSubtitle,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),

                    // Reading / Time Progress Bar
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: LinearProgressIndicator(
                        value: profile.priorityBookProgress,
                        minHeight: 5,
                        backgroundColor: const Color(0xFFE2E8F0),
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Color(0xFF0D9488),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 10),

              // Return Action Button
              OutlinedButton(
                onPressed: () => Get.toNamed(AppRoutes.borrowedBooks),
                style: OutlinedButton.styleFrom(
                  backgroundColor: const Color(0xFFF0FDF4),
                  side: const BorderSide(color: Color(0xFFBBF7D0), width: 1.2),
                  padding: EdgeInsets.symmetric(
                    horizontal: isTablet ? 14 : 10,
                    vertical: isTablet ? 8 : 6,
                  ),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  AppStrings.returnActionBtn,
                  style: const TextStyle(
                    color: Color(0xFF15803D),
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
