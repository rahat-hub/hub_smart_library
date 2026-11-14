import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/app_styles.dart';
import '../../../controllers/borrowed_books_controller.dart';
import '../../../models/book_model.dart';
import '../../../models/borrowed_book_model.dart';
import '../../dashboard/widgets/book_cover_widget.dart';

class BorrowedBookCard extends StatelessWidget {
  final BorrowedBookModel book;
  final BorrowedBooksController controller;
  final bool isTablet;

  const BorrowedBookCard({
    super.key,
    required this.book,
    required this.controller,
    this.isTablet = false,
  });

  @override
  Widget build(BuildContext context) {
    // Generate a temporary BookModel representation for cover rendering
    final dummyBook = BookModel(
      id: book.id,
      title: book.title,
      author: book.author,
      availableCopies: 1,
      rack: book.shelf,
      category: 'Computer Science',
      coverStyle: book.coverStyle,
    );

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: book.status == BorrowedStatus.overdue
              ? const Color(0xFFFECACA)
              : const Color(0xFFE2E8F0),
          width: 1.2,
        ),
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
          // 1. Header Row: Status Badge Tag + Book ID
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStatusBadge(),
              Text(
                book.id,
                style: const TextStyle(
                  fontSize: 11.5,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF94A3B8),
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // 2. Middle Section: Cover Thumbnail + Book Details
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Book Thumbnail
              BookCoverWidget(
                book: dummyBook,
                width: isTablet ? 54 : 46,
                height: isTablet ? 74 : 64,
                borderRadius: 8,
                isThumbnail: true,
              ),

              const SizedBox(width: 12),

              // Title, Author, Shelf Chip
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.title,
                      style: AppStyles.borrowedBookTitle.copyWith(
                        fontSize: isTablet ? 16.0 : 14.5,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      book.author,
                      style: AppStyles.borrowedBookAuthor.copyWith(
                        fontSize: isTablet ? 12.5 : 11.5,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        // Shelf Chip
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEFF6FF),
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: const Color(0xFFDBEAFE)),
                          ),
                          child: Text(
                            'শেলফ: ${book.shelf}',
                            style: const TextStyle(
                              fontSize: 11.0,
                              fontWeight: FontWeight.w700,
                              color: AppColors.linkBlue,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        // Edition or additional tag
                        Text(
                          book.edition,
                          style: const TextStyle(
                            fontSize: 11.0,
                            color: Color(0xFF64748B),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          // 3. Schedule / Due Date / Timeline Progress Bar
          _buildTimelineAndSchedule(),

          const SizedBox(height: 14),

          // 4. Action Buttons
          _buildActionButtons(),
        ],
      ),
    );
  }

  // Status Badge Builder
  Widget _buildStatusBadge() {
    switch (book.status) {
      case BorrowedStatus.dueToday:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3.5),
          decoration: BoxDecoration(
            color: AppColors.dueTodayBadgeBg,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: AppColors.dueTodayBadgeText,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                book.statusBadgeText.replaceAll('• ', ''),
                style: const TextStyle(
                  fontSize: 11.0,
                  fontWeight: FontWeight.w700,
                  color: AppColors.dueTodayBadgeText,
                ),
              ),
            ],
          ),
        );

      case BorrowedStatus.overdue:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3.5),
          decoration: BoxDecoration(
            color: AppColors.overdueBadgeBg,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.warning_amber_rounded,
                size: 13,
                color: AppColors.overdueBadgeText,
              ),
              const SizedBox(width: 4),
              Text(
                book.statusBadgeText.replaceAll('⚠ ', ''),
                style: const TextStyle(
                  fontSize: 11.0,
                  fontWeight: FontWeight.w700,
                  color: AppColors.overdueBadgeText,
                ),
              ),
            ],
          ),
        );

      case BorrowedStatus.onTime:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3.5),
          decoration: BoxDecoration(
            color: AppColors.onTimeBadgeBg,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: AppColors.onTimeBadgeText,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                book.statusBadgeText.replaceAll('• ', ''),
                style: const TextStyle(
                  fontSize: 11.0,
                  fontWeight: FontWeight.w700,
                  color: AppColors.onTimeBadgeText,
                ),
              ),
            ],
          ),
        );
    }
  }

  // Timeline / Schedule Builder
  Widget _buildTimelineAndSchedule() {
    if (book.status == BorrowedStatus.overdue) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFFFEF2F2),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xFFFEE2E2)),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ইস্যু: ${book.issueDate}',
                  style: const TextStyle(fontSize: 11.5, color: Color(0xFF64748B)),
                ),
                Text(
                  'নির্ধারিত দিন: ${book.dueDate}',
                  style: const TextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF475569),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.receipt_long_outlined,
                      size: 14,
                      color: Color(0xFFDC2626),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'বিলম্ব ফি: ${book.overdueDays} দিন × ৳${book.finePerDay.toInt()}',
                      style: const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFB91C1C),
                      ),
                    ),
                  ],
                ),
                Text(
                  book.fineTextBengali,
                  style: const TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFFDC2626),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    // For Due Today or On-Time:
    final isDueToday = book.status == BorrowedStatus.dueToday;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'ইস্যু: ${book.issueDate}',
              style: const TextStyle(fontSize: 11.5, color: Color(0xFF64748B)),
            ),
            Text(
              'নির্ধারিত দিন: ${book.dueDate}',
              style: TextStyle(
                fontSize: 11.5,
                fontWeight: FontWeight.bold,
                color: isDueToday ? AppColors.warningAmber : const Color(0xFF475569),
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: SizedBox(
            height: 6,
            child: LinearProgressIndicator(
              value: book.progress,
              backgroundColor: const Color(0xFFF1F5F9),
              valueColor: AlwaysStoppedAnimation<Color>(
                isDueToday ? AppColors.dueTodayBar : AppColors.onTimeBar,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Action Buttons Builder
  Widget _buildActionButtons() {
    if (book.status == BorrowedStatus.overdue) {
      // Overdue: Pay fine & Return Process
      return SizedBox(
        width: double.infinity,
        height: 44,
        child: ElevatedButton.icon(
          onPressed: controller.payFineModal,
          icon: const Icon(Icons.credit_card_rounded, size: 18),
          label: const Text(
            AppStrings.btnPayFineAndReturn,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.overdueButtonBg,
            foregroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      );
    }

    // Normal buttons: Return Barcode + Renew Request
    return Row(
      children: [
        // Button 1: রিটার্ন বারকোড
        Expanded(
          child: SizedBox(
            height: 42,
            child: OutlinedButton.icon(
              onPressed: () => controller.showReturnBarcode(book),
              icon: const Icon(
                Icons.qr_code_2_rounded,
                size: 18,
                color: AppColors.navyPrimary,
              ),
              label: Text(
                AppStrings.btnReturnBarcode,
                style: const TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.navyPrimary,
                ),
              ),
              style: OutlinedButton.styleFrom(
                backgroundColor: const Color(0xFFF0F5FF),
                side: const BorderSide(color: Color(0xFFDBEAFE)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),

        const SizedBox(width: 10),

        // Button 2: রিনিউ রিকোয়েস্ট
        Expanded(
          child: SizedBox(
            height: 42,
            child: ElevatedButton.icon(
              onPressed: () => controller.showRenewRequest(book),
              icon: const Icon(
                Icons.sync_rounded,
                size: 18,
                color: Colors.white,
              ),
              label: Text(
                AppStrings.btnRenewRequest,
                style: const TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.navyPrimary,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
