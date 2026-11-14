import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/app_styles.dart';
import '../../../controllers/notification_controller.dart';
import '../../../models/book_model.dart';
import '../../../models/notification_model.dart';
import '../../dashboard/widgets/book_cover_widget.dart';

class ApprovedRequestCard extends StatelessWidget {
  final NotificationModel notification;
  final NotificationController controller;
  final bool isTablet;

  const ApprovedRequestCard({
    super.key,
    required this.notification,
    required this.controller,
    this.isTablet = false,
  });

  @override
  Widget build(BuildContext context) {
    final dummyBook = BookModel(
      id: 'dsa_notif',
      title: notification.bookTitle ?? 'Data Structures',
      author: 'Goodrich',
      availableCopies: 1,
      rack: 'CS-08',
      category: 'CS',
      coverStyle: BookCoverStyle.pythonDataStructures,
    );

    return Container(
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
          // 1. Top Row: Circular Icon + Badge + Time
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon Circle
              Container(
                width: isTablet ? 38 : 34,
                height: isTablet ? 38 : 34,
                decoration: BoxDecoration(
                  color: notification.iconBg,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  notification.icon,
                  color: notification.iconColor,
                  size: isTablet ? 20 : 18,
                ),
              ),

              const SizedBox(width: 10),

              // Badge & Title Column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Badge Tag
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: notification.badgeBg,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            notification.badgeText,
                            style: AppStyles.notifBadge.copyWith(
                              color: notification.badgeColor,
                            ),
                          ),
                        ),

                        // Time
                        Text(
                          notification.timeAgo,
                          style: AppStyles.notifTime,
                        ),
                      ],
                    ),

                    const SizedBox(height: 5),

                    // Title
                    Text(
                      notification.title,
                      style: AppStyles.notifSectionTitle.copyWith(
                        fontSize: isTablet ? 16.0 : 15.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // 2. Mini Book Info Box
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: Row(
              children: [
                // Book Thumbnail
                BookCoverWidget(
                  book: dummyBook,
                  width: 36,
                  height: 48,
                  borderRadius: 6,
                  isThumbnail: true,
                ),

                const SizedBox(width: 12),

                // Book Title & Dewey/Author
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notification.bookTitle ?? '',
                        style: AppStyles.notifBookTitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        notification.bookSubtitle ?? '',
                        style: AppStyles.notifBookSubtitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // 3. Description
          Text(
            notification.description,
            style: AppStyles.notifBody.copyWith(
              fontSize: isTablet ? 13.0 : 12.0,
            ),
          ),

          const SizedBox(height: 12),

          // 4. Action Button
          SizedBox(
            width: double.infinity,
            height: 44,
            child: ElevatedButton.icon(
              onPressed: () => controller.showTokenModal(notification),
              icon: const Icon(Icons.qr_code_2_rounded, size: 18),
              label: Text(
                AppStrings.viewCollectionToken,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0),
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
        ],
      ),
    );
  }
}
