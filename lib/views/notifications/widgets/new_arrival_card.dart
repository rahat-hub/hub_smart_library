import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/app_styles.dart';
import '../../../controllers/notification_controller.dart';
import '../../../models/book_model.dart';
import '../../../models/notification_model.dart';
import '../../dashboard/widgets/book_cover_widget.dart';

class NewArrivalCard extends StatelessWidget {
  final NotificationModel notification;
  final NotificationController controller;
  final bool isTablet;

  const NewArrivalCard({
    super.key,
    required this.notification,
    required this.controller,
    this.isTablet = false,
  });

  @override
  Widget build(BuildContext context) {
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

          const SizedBox(height: 8),

          // 2. Subtitle Description
          Text(
            notification.description,
            style: AppStyles.notifBody.copyWith(
              fontSize: isTablet ? 13.0 : 12.0,
            ),
          ),

          const SizedBox(height: 14),

          // 3. Row of 3 Book Covers Showcase
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildArrivalBookItem(
                  title: 'Deep Learning',
                  coverStyle: BookCoverStyle.deepLearning,
                ),
                _buildArrivalBookItem(
                  title: 'Pattern Recog.',
                  coverStyle: BookCoverStyle.dataIntensive,
                ),
                _buildArrivalBookItem(
                  title: 'Generative AI',
                  coverStyle: BookCoverStyle.databaseSystems,
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // 4. Action Link: নতুন সংগ্রহ ঘুরে দেখুন →
          InkWell(
            onTap: controller.exploreNewArrivals,
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    AppStrings.exploreNewCollection,
                    style: const TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors.navyPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildArrivalBookItem({
    required String title,
    required BookCoverStyle coverStyle,
  }) {
    final book = BookModel(
      id: title,
      title: title,
      author: 'Author',
      availableCopies: 1,
      rack: 'AI-01',
      category: 'AI',
      coverStyle: coverStyle,
    );

    return Column(
      children: [
        BookCoverWidget(
          book: book,
          width: isTablet ? 64 : 54,
          height: isTablet ? 84 : 70,
          borderRadius: 6,
          isThumbnail: true,
        ),
        const SizedBox(height: 6),
        Text(
          title,
          style: const TextStyle(
            fontSize: 11.0,
            fontWeight: FontWeight.w600,
            color: Color(0xFF334155),
          ),
        ),
      ],
    );
  }
}
