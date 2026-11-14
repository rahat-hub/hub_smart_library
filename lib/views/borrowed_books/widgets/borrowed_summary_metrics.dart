import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/app_styles.dart';
import '../../../controllers/borrowed_books_controller.dart';

class BorrowedSummaryMetrics extends StatelessWidget {
  final BorrowedBooksController controller;
  final bool isTablet;

  const BorrowedSummaryMetrics({
    super.key,
    required this.controller,
    this.isTablet = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Card 1: মোট ইস্যুকৃত (Total Issued)
        Expanded(
          child: _buildMetricCard(
            icon: Icons.menu_book_rounded,
            iconColor: AppColors.navyPrimary,
            dotColor: AppColors.navyPrimary,
            label: AppStrings.totalIssuedLabel,
            valueWidget: Obx(
              () => Text(
                '${controller.totalIssuedCount}টি বই',
                style: AppStyles.metricCardValue.copyWith(
                  fontSize: isTablet ? 20.0 : 17.0,
                ),
              ),
            ),
          ),
        ),

        const SizedBox(width: 10),

        // Card 2: রিটার্ন বাকি (Return Pending)
        Expanded(
          child: _buildMetricCard(
            icon: Icons.access_time_rounded,
            iconColor: AppColors.warningAmber,
            dotColor: AppColors.warningAmber,
            label: AppStrings.returnPendingLabel,
            valueWidget: Obx(
              () => Text(
                '${controller.dueTodayCount}টি আজই',
                style: AppStyles.metricCardValue.copyWith(
                  color: AppColors.warningAmber,
                  fontSize: isTablet ? 20.0 : 17.0,
                ),
              ),
            ),
          ),
        ),

        const SizedBox(width: 10),

        // Card 3: বকেয়া ফাইন (Pending Fine)
        Expanded(
          child: _buildMetricCard(
            icon: Icons.payments_outlined,
            iconColor: const Color(0xFFDC2626),
            dotColor: const Color(0xFFDC2626),
            label: AppStrings.pendingFineLabel,
            valueWidget: Obx(
              () => Text(
                controller.totalFineBengali,
                style: AppStyles.metricCardValue.copyWith(
                  color: controller.totalPendingFine.value > 0
                      ? const Color(0xFFDC2626)
                      : AppColors.availableGreenText,
                  fontSize: isTablet ? 20.0 : 17.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMetricCard({
    required IconData icon,
    required Color iconColor,
    required Color dotColor,
    required String label,
    required Widget valueWidget,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isTablet ? 14.0 : 10.0,
        vertical: isTablet ? 14.0 : 11.0,
      ),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon and status dot
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: iconColor, size: isTablet ? 22 : 19),
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: dotColor,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: AppStyles.metricCardLabel.copyWith(
              fontSize: isTablet ? 12.5 : 11.0,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2),
          valueWidget,
        ],
      ),
    );
  }
}
