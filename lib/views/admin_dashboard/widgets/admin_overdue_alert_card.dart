import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../controllers/admin_dashboard_controller.dart';

class AdminOverdueAlertCard extends StatelessWidget {
  final AdminDashboardController controller;
  final bool isTablet;

  const AdminOverdueAlertCard({
    super.key,
    required this.controller,
    this.isTablet = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.error_outline_rounded,
                  color: Color(0xFFDC2626),
                  size: 18,
                ),
                const SizedBox(width: 8),
                Text(
                  AppStrings.urgentOverdueTitle,
                  style: TextStyle(
                    fontSize: isTablet ? 15.5 : 14.0,
                    fontWeight: FontWeight.w800,
                    color: AppColors.slateHeading,
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2.5),
              decoration: BoxDecoration(
                color: const Color(0xFFFEE2E2),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFFECACA)),
              ),
              child: Text(
                AppStrings.actionRequiredBadge,
                style: const TextStyle(
                  fontSize: 10.5,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFDC2626),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        // Overdue Alert Card
        Obx(() {
          if (controller.overdueAlerts.isEmpty) {
            return const SizedBox.shrink();
          }

          final item = controller.overdueAlerts.first;

          return Container(
            padding: EdgeInsets.all(isTablet ? 16 : 14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFFECACA), width: 1.2),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFDC2626).withValues(alpha: 0.03),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Row 1: Student Avatar + Name & Book
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFEE2E2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.person_rounded,
                        color: Color(0xFFDC2626),
                        size: 22,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${item.studentName} (${item.studentRoll})',
                            style: TextStyle(
                              fontSize: isTablet ? 14.5 : 13.5,
                              fontWeight: FontWeight.bold,
                              color: AppColors.slateHeading,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'বই: ${item.bookTitle}',
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.slateSubtitle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // Row 2: Overdue Days & Fine Amount
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF7ED),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xFFFFEDD5)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'বিলম্বের সময়কাল: ',
                            style: TextStyle(fontSize: 11, color: Color(0xFF9A3412)),
                          ),
                          Text(
                            '⚠ ${AppStrings.formatNumber(item.overdueDays)} দিন ওভারডিউ',
                            style: const TextStyle(
                              fontSize: 11.5,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFDC2626),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            'মোট বকেয়া জরিমানা: ',
                            style: TextStyle(fontSize: 11, color: Color(0xFF9A3412)),
                          ),
                          Text(
                            AppStrings.formatCurrency(item.fineAmount),
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: AppColors.slateHeading,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                // Row 3: Action Buttons (SMS Reminder + Call)
                Row(
                  children: [
                    // SMS Reminder Button
                    Expanded(
                      child: SizedBox(
                        height: 42,
                        child: ElevatedButton.icon(
                          onPressed: () => controller.sendSmsReminder(item),
                          icon: const Icon(Icons.chat_bubble_outline_rounded, size: 16),
                          label: Text(
                            item.isReminderSent
                                ? (AppStrings.isEnglish ? 'Reminder Sent ✓' : 'রিমাইন্ডার পাঠানো হয়েছে ✓')
                                : AppStrings.sendSmsReminder,
                            style: const TextStyle(
                              fontSize: 12.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF0F2B5C),
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 8),

                    // Call Button
                    SizedBox(
                      width: 44,
                      height: 42,
                      child: OutlinedButton(
                        onPressed: () => controller.callStudent(item),
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          backgroundColor: const Color(0xFFF8FAFC),
                          side: const BorderSide(color: Color(0xFFE2E8F0)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Icon(
                          Icons.phone_rounded,
                          color: AppColors.navyPrimary,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}
