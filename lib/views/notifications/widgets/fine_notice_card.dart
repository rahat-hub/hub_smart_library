import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/app_styles.dart';
import '../../../controllers/notification_controller.dart';
import '../../../models/notification_model.dart';

class FineNoticeCard extends StatelessWidget {
  final NotificationModel notification;
  final NotificationController controller;
  final bool isTablet;

  const FineNoticeCard({
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
        border: Border.all(color: const Color(0xFFFECACA), width: 1.2),
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

          // 2. Mini Fine Breakdown Box
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFFF0F4FF),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFDCE7F6)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left Book info & overdue days
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.menu_book_rounded,
                      color: Color(0xFFDC2626),
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          notification.bookTitle ?? 'Operating System Concepts',
                          style: const TextStyle(
                            fontSize: 12.5,
                            fontWeight: FontWeight.w700,
                            color: AppColors.slateHeading,
                          ),
                        ),
                        const SizedBox(height: 1),
                        Text(
                          notification.fineRate ?? 'বিলম্ব সময়: ৯ দিন (৳৫/দিন)',
                          style: const TextStyle(fontSize: 11.0, color: Color(0xFF64748B)),
                        ),
                      ],
                    ),
                  ],
                ),

                // Right: Fine Amount + Invoice ID
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '৳${notification.fineAmount?.toStringAsFixed(2) ?? '৪৫.০০'}',
                      style: const TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFFDC2626),
                      ),
                    ),
                    Text(
                      'চালান: ${notification.invoiceId ?? '#FIN-8201'}',
                      style: const TextStyle(fontSize: 10.5, color: Color(0xFF94A3B8)),
                    ),
                  ],
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

          // 4. Action Button (Pay Fine)
          SizedBox(
            width: double.infinity,
            height: 44,
            child: ElevatedButton.icon(
              onPressed: () => controller.payFineFromNotification(notification),
              icon: const Icon(Icons.credit_card_rounded, size: 18),
              label: Text(
                AppStrings.payFineNotification,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0),
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
          ),
        ],
      ),
    );
  }
}
