import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/app_styles.dart';
import '../../../controllers/notification_controller.dart';
import '../../../models/notification_model.dart';

class DueReminderCard extends StatelessWidget {
  final NotificationModel notification;
  final NotificationController controller;
  final bool isTablet;

  const DueReminderCard({
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

          const SizedBox(height: 12),

          // 2. Mini Book Progress Box
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        notification.bookTitle ?? 'Computer Networking',
                        style: const TextStyle(
                          fontSize: 12.5,
                          fontWeight: FontWeight.w700,
                          color: AppColors.slateHeading,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      notification.dueTimeText ?? '৪:৩০ PM পর্যন্ত',
                      style: const TextStyle(
                        fontSize: 11.5,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFB45309),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Container(
                    height: 5,
                    width: double.infinity,
                    color: const Color(0xFFF59E0B),
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

          // 4. Action Buttons (Renew + Location Pin)
          Row(
            children: [
              // Renew Button
              Expanded(
                child: SizedBox(
                  height: 42,
                  child: ElevatedButton.icon(
                    onPressed: () => controller.renewFromNotification(notification),
                    icon: const Icon(
                      Icons.sync_rounded,
                      size: 17,
                      color: AppColors.navyPrimary,
                    ),
                    label: Text(
                      AppStrings.renewApplication,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.5,
                        color: AppColors.navyPrimary,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFEFF6FF),
                      foregroundColor: AppColors.navyPrimary,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      side: const BorderSide(color: Color(0xFFDBEAFE)),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 8),

              // Location Pin Button
              InkWell(
                onTap: () {
                  // Show library desk location info
                },
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFF6FF),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xFFDBEAFE)),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.location_on_outlined,
                      color: AppColors.navyPrimary,
                      size: 20,
                    ),
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
