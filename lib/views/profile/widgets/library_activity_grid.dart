import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../models/profile_model.dart';
import '../../../routes/app_routes.dart';

class LibraryActivityGrid extends StatelessWidget {
  final ProfileModel profile;
  final bool isTablet;

  const LibraryActivityGrid({
    super.key,
    required this.profile,
    this.isTablet = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 1. Section Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.libraryActivityTitle,
              style: TextStyle(
                color: AppColors.slateHeading,
                fontSize: isTablet ? 16.0 : 14.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            InkWell(
              onTap: () => Get.toNamed(AppRoutes.borrowedBooks),
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child: Row(
                  children: [
                    Text(
                      AppStrings.detailedHistoryLink,
                      style: TextStyle(
                        color: AppColors.tealBrand,
                        fontSize: isTablet ? 12.5 : 11.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Icon(
                      Icons.chevron_right_rounded,
                      size: 16,
                      color: AppColors.tealBrand,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        // 2. Metrics Grid (2x2 on Mobile, 4x1 on Tablet/Desktop)
        LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth > 580;

            if (isWide) {
              return Row(
                children: [
                  Expanded(
                    child: _buildMetricCard(
                      icon: Icons.menu_book_rounded,
                      iconColor: const Color(0xFF2563EB),
                      iconBg: const Color(0xFFEFF6FF),
                      tagText: AppStrings.active,
                      tagBg: const Color(0xFFDCFCE7),
                      tagTextColor: const Color(0xFF16A34A),
                      stat: AppStrings.currentIssuedCountLabel,
                      label: AppStrings.currentIssuedSubtitle,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildMetricCard(
                      icon: Icons.auto_stories_rounded,
                      iconColor: const Color(0xFF0D9488),
                      iconBg: const Color(0xFFCCFBF1),
                      tagText: AppStrings.total,
                      tagBg: const Color(0xFFE0E7FF),
                      tagTextColor: const Color(0xFF4338CA),
                      stat: AppStrings.totalBorrowedCountLabel,
                      label: AppStrings.totalBorrowedSubtitle,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildMetricCard(
                      icon: Icons.timer_outlined,
                      iconColor: const Color(0xFF2563EB),
                      iconBg: const Color(0xFFEFF6FF),
                      showRing: true,
                      stat: AppStrings.onTimeReturnRateLabel,
                      label: AppStrings.onTimeReturnRateSubtitle,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildMetricCard(
                      icon: Icons.account_balance_wallet_outlined,
                      iconColor: const Color(0xFF0D9488),
                      iconBg: const Color(0xFFCCFBF1),
                      tagText: AppStrings.paid,
                      tagBg: const Color(0xFFDCFCE7),
                      tagTextColor: const Color(0xFF16A34A),
                      stat: AppStrings.currentFineLabel,
                      label: AppStrings.currentFineSubtitle,
                    ),
                  ),
                ],
              );
            }

            // Mobile 2x2 Grid
            return Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _buildMetricCard(
                        icon: Icons.menu_book_rounded,
                        iconColor: const Color(0xFF2563EB),
                        iconBg: const Color(0xFFEFF6FF),
                        tagText: AppStrings.active,
                        tagBg: const Color(0xFFDCFCE7),
                        tagTextColor: const Color(0xFF16A34A),
                        stat: AppStrings.currentIssuedCountLabel,
                        label: AppStrings.currentIssuedSubtitle,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _buildMetricCard(
                        icon: Icons.auto_stories_rounded,
                        iconColor: const Color(0xFF0D9488),
                        iconBg: const Color(0xFFCCFBF1),
                        tagText: AppStrings.total,
                        tagBg: const Color(0xFFE0E7FF),
                        tagTextColor: const Color(0xFF4338CA),
                        stat: AppStrings.totalBorrowedCountLabel,
                        label: AppStrings.totalBorrowedSubtitle,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: _buildMetricCard(
                        icon: Icons.timer_outlined,
                        iconColor: const Color(0xFF2563EB),
                        iconBg: const Color(0xFFEFF6FF),
                        showRing: true,
                        stat: AppStrings.onTimeReturnRateLabel,
                        label: AppStrings.onTimeReturnRateSubtitle,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _buildMetricCard(
                        icon: Icons.account_balance_wallet_outlined,
                        iconColor: const Color(0xFF0D9488),
                        iconBg: const Color(0xFFCCFBF1),
                        tagText: AppStrings.paid,
                        tagBg: const Color(0xFFDCFCE7),
                        tagTextColor: const Color(0xFF16A34A),
                        stat: AppStrings.currentFineLabel,
                        label: AppStrings.currentFineSubtitle,
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildMetricCard({
    required IconData icon,
    required Color iconColor,
    required Color iconBg,
    String? tagText,
    Color? tagBg,
    Color? tagTextColor,
    bool showRing = false,
    required String stat,
    required String label,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row: Icon + Badge/Ring
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: iconBg,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: iconColor, size: 18),
              ),
              if (tagText != null)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                  decoration: BoxDecoration(
                    color: tagBg,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    tagText,
                    style: TextStyle(
                      color: tagTextColor,
                      fontSize: 10.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              if (showRing)
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xFF10B981), width: 2.5),
                  ),
                ),
            ],
          ),

          const SizedBox(height: 12),

          // Big Stat
          Text(
            stat,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: AppColors.slateHeading,
            ),
          ),

          const SizedBox(height: 2),

          // Label
          Text(
            label,
            style: const TextStyle(
              fontSize: 11.5,
              fontWeight: FontWeight.w500,
              color: AppColors.slateSubtitle,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
